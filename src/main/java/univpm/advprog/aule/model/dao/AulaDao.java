package univpm.advprog.aule.model.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import univpm.advprog.aule.model.entities.Aula;
import univpm.advprog.aule.model.entities.Prenotation;

public interface AulaDao {
	
	public Session getSession();
	public void setSession(Session session);
	
	List<Aula> findAll();
	
	Aula findById(long id);
	
	Aula create(int numeroPosti, boolean presentiPrese);
	
	Aula update(Aula aula);
	
	void delete(Aula aula);
	
	Set<Prenotation> getPrenotazioni(Aula aula);
	
}
