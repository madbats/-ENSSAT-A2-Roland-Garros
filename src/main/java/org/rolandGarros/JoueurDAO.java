package org.rolandGarros;

import java.util.Collection;
import java.util.Optional;

public interface JoueurDAO extends Dao<Joueur> {
    Collection<Joueur> getAll();
    Collection<Joueur> getAllByWins();
    Collection<Joueur> getAllByTimePlayed();
    Collection<Joueur> getAllMenByMostSetsWon();
    Collection<Joueur> getAllMenByLeastSetsLost();
    Collection<Joueur> getAllMenByWins();
    Collection<Joueur> getAllWomenByMostSetsWon();
    Collection<Joueur> getAllWomenByLeastSetsLost();
    Collection<Joueur> getAllWomenByWins();
    
    int save(Joueur t);
    void update(Joueur t);
    void delete(Joueur t);
    
	Optional<Joueur> get(int id);
}
