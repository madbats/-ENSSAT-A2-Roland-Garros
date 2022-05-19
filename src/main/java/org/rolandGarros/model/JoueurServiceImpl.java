package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

public class JoueurServiceImpl implements Service<Joueur> {
	private Dao<Joueur> joueurDao = new JoueurDAOImpl();
	
	@Override
	public Collection<Joueur> getAll() {
		
		return this.joueurDao.getAll();
	}

	public Collection<Joueur> getAllMen() {
		return this.joueurDao.getAll().stream().filter(j-> j.getCategorie().matches("H")).toList();
	}

	public Collection<Joueur> getAllWomen() {
		return this.joueurDao.getAll().stream().filter(j-> j.getCategorie().matches("F")).toList();
	}

	@Override
	public int save(Joueur t) {
		
		return this.joueurDao.save(t);
	}

	@Override
	public void update(Joueur t) {
		this.joueurDao.update(t);
	}

	@Override
	public void delete(Joueur t) {
		this.joueurDao.delete(t);
	}

	@Override
	public Optional<Joueur> get(int id) {
		return this.joueurDao.get(id);
	}

}
