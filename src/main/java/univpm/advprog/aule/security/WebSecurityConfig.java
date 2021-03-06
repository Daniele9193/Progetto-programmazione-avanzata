package univpm.advprog.aule.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import univpm.advprog.aule.services.UserServiceDefault;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		 //http
         //.formLogin()
         //.and()
         //.authorizeRequests()
         //.antMatchers("/**").permitAll()
         //.antMatchers(HttpMethod.POST, "/**").permitAll()
         //.and()
         //.csrf().disable();
		http.authorizeRequests().
		antMatchers("/login").permitAll().
		antMatchers("/").permitAll().
		
		antMatchers("/prenotations/list").authenticated().		//Azioni possibili solo a chi � loggato con un profilo qualsiasi
		antMatchers("/aula/list").authenticated().				
		antMatchers("/myprofile/profile").authenticated().		
		antMatchers("/myprofile/upload").authenticated().		
		
		antMatchers("/prenotations/myprenotations/**").hasAnyRole("Admin","Teacher").		//Azioni possibili solo agli utenti dotati di certi ruoli
		antMatchers("/myprofile/userlist").hasAnyRole("Admin").								
		antMatchers("/prenotations/create/**").hasAnyRole("Admin","Teacher").				
		antMatchers("/prenotations/delete/**").hasAnyRole("Admin","Teacher").				
		antMatchers("/prenotations/save/**").hasAnyRole("Admin","Teacher").
		antMatchers("/aula/create/**").hasAnyRole("Admin").
		antMatchers("/aula/edit/**").hasAnyRole("Admin").
		antMatchers("/aula/delete/**").hasAnyRole("Admin").
	    antMatchers("/aula/save/**").hasAnyRole("Admin").
		
		
		and().formLogin().loginPage("/login").defaultSuccessUrl("/"). 	//pagina dove va quando la login ha successo
		failureUrl("/login?error=true").permitAll(). 					//pagina dove va se la login non ha successo
		and().logout().logoutSuccessUrl("/") 							//va a / dopo il logout. default path per logout è /logout
		.invalidateHttpSession(true).permitAll().
		and().csrf().disable();
			
	}

	@Bean
	public UserDetailsService userDetailsService() {
		return new UserServiceDefault();
	};

	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception {

//		auth.inMemoryAuthentication().withUser("imuser")
//			.password(this.passwordEncoder.encode("imuser"))
//			.roles("USER");
//		auth.inMemoryAuthentication().withUser("imadmin")
//			.password(this.passwordEncoder.encode("imadmin"))
//			.roles("USER", "ADMIN");

		auth.userDetailsService(userDetailsService()).passwordEncoder(this.passwordEncoder);
//		auth.userDetailsService(this.userDetailsService).passwordEncoder(this.passwordEncoder);
	}

}