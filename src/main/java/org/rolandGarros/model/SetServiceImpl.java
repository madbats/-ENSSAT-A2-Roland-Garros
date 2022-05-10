package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

public class SetServiceImpl implements SetService {
	private Dao<Set> setDao = new SetDAOImpl();
	

	@Override
	public Collection<Set> getAll() {
		return this.setDao.getAll();
	}

	@Override
	public int save(Set t) {
		return this.setDao.save(t);
	}

	@Override
	public void update(Set t) {
		this.setDao.update(t);
	}

	@Override
	public void delete(Set t) {
		this.setDao.delete(t);
	}

	@Override
	public Optional<Set> get(int id) {
		return this.setDao.get(id);
	}

}
