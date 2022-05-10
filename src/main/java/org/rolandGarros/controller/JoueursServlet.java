package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.rolandGarros.model.Joueur;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/joueurs")
public class JoueursServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sort = request.getParameter("sort");
		sort = (sort!=null)? sort:"nom";
		Service<Joueur> joueurService = new JoueurServiceImpl();
		List<Joueur> listJoueurs = new ArrayList<Joueur>(joueurService.getAll());
		switch(sort) {
			case "nom": listJoueurs.sort((j1,j2)->nomComparerer(j1,j2));
			case "classement": listJoueurs.sort((j1,j2)->classementComparerer(j1,j2));
			case "sex": listJoueurs.sort((j1,j2)->sexComparerer(j1,j2));
			case "victoire": listJoueurs.sort((j1,j2)->victoireComparerer(j1,j2));
			case "duree": listJoueurs.sort((j1,j2)->dureeComparerer(j1,j2));
		}
        String pageName="/joueurs.jsp";
        request.setAttribute("listJoueurs", listJoueurs);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
        try {
              rd.forward(request, response);
        } catch (ServletException e) {
              e.printStackTrace();
        } catch (IOException e) {
              e.printStackTrace();
        }
	}
	
	private int nomComparerer(Joueur j1, Joueur j2) {
		return j1.getNom().compareTo(j2.getNom());
	}
	private int classementComparerer(Joueur j1, Joueur j2) {
		return j1.getClassement() - j2.getClassement();
	}
	private int sexComparerer(Joueur j1, Joueur j2) {
		return j1.getCategorie().compareTo(j2.getCategorie());
	}
	private int victoireComparerer(Joueur j1, Joueur j2) {
		return j1.getVictoires() - j2.getVictoires();
	}	
	private int dureeComparerer(Joueur j1, Joueur j2) {
		return j1.getMatchs().stream().mapToInt(m->m.getDureeSecondes()).sum() - j2.getMatchs().stream().mapToInt(m->m.getDureeSecondes()).sum();
	}
}
