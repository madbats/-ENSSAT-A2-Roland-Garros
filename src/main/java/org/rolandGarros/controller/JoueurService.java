package org.rolandGarros.controller;

import java.util.Collection;
import java.util.Optional;

import org.rolandGarros.model.Joueur;

public interface JoueurService extends Service<Joueur> {
	Collection<Joueur> getAll();
    Collection<Joueur> getAllMen();
    Collection<Joueur> getAllWomen();

	
    int save(Joueur t);
    void update(Joueur t);
    void delete(Joueur t);
    Optional<Joueur> get(int id);
}
