package org.rolandGarros.controller;

import java.util.Collection;
import java.util.Optional;

import org.rolandGarros.model.Match;

public interface MatchService extends Service<Match> {
	Collection<Match> getAll();
	
    int save(Match t);
    void update(Match t);
    void delete(Match t);
    Optional<Match> get(int id);
}
