package org.rolandGarros.model;

import java.util.Collection;
import java.util.Optional;

public interface Service<T> {
	
	// private Dao<T> dao;
	
	Collection<T> getAll();
    int save(T t);
    void update(T t);
    void delete(T t);
    Optional<T> get(int id);

    // private void validate(T t);
}
