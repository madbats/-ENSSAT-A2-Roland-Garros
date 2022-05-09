package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

import org.rolandGarros.controller.Service;

public interface MatchService extends Service<Match> {
	Collection<Match> getAll();
	
    int save(Match t);
    void update(Match t);
    void delete(Match t);
    Optional<Match> get(int id);
}
