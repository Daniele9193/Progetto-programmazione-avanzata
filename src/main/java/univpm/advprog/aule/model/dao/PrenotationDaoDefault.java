package univpm.advprog.aule.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import univpm.advprog.aule.model.entities.Prenotation;
import univpm.advprog.aule.model.entities.User;
import univpm.advprog.aule.model.entities.Aula;

@Transactional
@Repository("prenotationDao")
public class PrenotationDaoDefault extends DefaultDao implements PrenotationDao {

	@Override
	public List<Prenotation> findAll() {
		return getSession().
				createQuery("from Prenotation p", Prenotation.class).
				getResultList();
	}
	
	@Override
	public Prenotation findById(Long id) {
		return getSession().find(Prenotation.class, id);
	}
	
	@Override
	public void delete(Prenotation prenotation) {
		this.getSession().delete(prenotation);
	}
	
	@Override
	public Prenotation create(DateTime oraInizio, DateTime oraFine, User user, Aula aula, String nomeEvento, String note) {
		Prenotation prenotation = new Prenotation();
		prenotation.setOraInizio(oraInizio);
		prenotation.setOraFine(oraFine);
		prenotation.setUser(user);
		prenotation.setAula(aula);
		prenotation.setNomeEvento(nomeEvento);
		prenotation.setNote(note);
		this.getSession().save(prenotation);
		return prenotation;
	}
	
	@Override 
	public Prenotation update(Prenotation prenotation) {
		return(Prenotation)this.getSession().merge(prenotation);
	}

	@Override
	public List<Prenotation> findByAula(Aula aula) {
		return this.getSession().createQuery("FROM Prenotation p JOIN FETCH p.aula WHERE p.aula= :aula", Prenotation.class).
				setParameter("aula", aula).getResultList();
				
	}

	@Override
	public Prenotation findByAulaOra(Aula aula, DateTime oraInizio) {
		return this.getSession().createQuery("FROM Prenotation p WHERE p.aula= :aula AND p.oraInizio= :oraInizio", Prenotation.class).
				setParameter("aula", aula).setParameter("oraInizio", oraInizio).getSingleResult();
	}
	
}
