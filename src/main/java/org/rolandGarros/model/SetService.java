package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

import org.rolandGarros.controller.Service;

public interface SetService extends Service<Set> {
	Collection<Set> getAll();
	
	int save(Set t);
	void update(Set t);
	void delete(Set t);
	
	Optional<Set> get(int id);
}
