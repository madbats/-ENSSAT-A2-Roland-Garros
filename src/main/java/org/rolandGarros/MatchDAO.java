package org.rolandGarros;

import java.util.Collection;
import java.util.Optional;

public interface MatchDAO extends Dao<Match> {
	Optional<Match> get(int id);
    Collection<Match> getAll();
    int save(Match t);
    void update(Match t);
    void delete(Match t);
}
