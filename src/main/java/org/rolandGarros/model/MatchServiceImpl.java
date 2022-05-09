package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

public class MatchServiceImpl implements MatchService {
	private Dao<Match> matchDao = new MatchDAOImpl();

	@Override
	public Collection<Match> getAll() {
		// TODO Auto-generated method stub
		return this.matchDao.getAll();
	}

	@Override
	public int save(Match t) {
		return this.matchDao.save(t);
	}

	@Override
	public void update(Match t) {
		this.matchDao.update(t);

	}

	@Override
	public void delete(Match t) {
		this.matchDao.delete(t);

	}

	@Override
	public Optional<Match> get(int id) {
		return this.matchDao.get(id);
	}

}
