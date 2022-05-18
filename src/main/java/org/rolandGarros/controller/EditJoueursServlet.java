package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditJoueurs")
public class EditJoueursServlet extends HttpServlet {

	private JoueurServiceImpl service = new JoueurServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sort = request.getParameter("sort");
		sort = (sort!=null)? sort:"nom";
		Service<Joueur> joueurService = new JoueurServiceImpl();
		List<Joueur> listJoueurs = new ArrayList<Joueur>(joueurService.getAll());
		
		switch(sort) {
			case "nom": listJoueurs.sort((j1,j2)->nomComparerer(j1,j2));
				break;
			case "classement": listJoueurs.sort((j1,j2)->classementComparerer(j1,j2));
			break;
			case "sexe": listJoueurs.sort((j1,j2)->sexComparerer(j1,j2));
			break;
			case "victoire": listJoueurs.sort((j1,j2)->victoireComparerer(j1,j2));
			break;
			case "duree": listJoueurs.sort((j1,j2)->dureeComparerer(j1,j2));
			break;
		}
        String pageName="/EditJoueur.jsp";
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
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prenom = req.getParameter("prenom");
		String nom = req.getParameter("nom");
		int age = Integer.parseInt(req.getParameter("age"));
		String lieuNaissance = req.getParameter("lieu_naissance");
		float taille = Float.parseFloat(req.getParameter("taille"));
		int poids = Integer.parseInt(req.getParameter("poids"));
		String nationnalite = req.getParameter("nationnalite");
		int debutCarriere = Integer.parseInt(req.getParameter("debut_carriere"));
		String main = req.getParameter("main");
		int classement = Integer.parseInt(req.getParameter("classement"));
		String entraineur = req.getParameter("entraineur");
		int salaire = Integer.parseInt(req.getParameter("salaire"));
		int victoires = Integer.parseInt(req.getParameter("victoires"));
		int defaites = Integer.parseInt(req.getParameter("defaites"));
		String categorie = req.getParameter("categorie");
		
		Joueur joueur = new Joueur(prenom, nom, age, lieuNaissance, taille, poids, nationnalite, debutCarriere, main, classement, entraineur, salaire, victoires, defaites, categorie);
		System.out.println(joueur);
		
		service.save(joueur);
		
		this.doGet(req, resp);
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
