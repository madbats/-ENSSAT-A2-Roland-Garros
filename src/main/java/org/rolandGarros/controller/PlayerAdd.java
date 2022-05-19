package org.rolandGarros.controller;

import java.io.IOException;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/jm/new")
public class PlayerAdd extends jakarta.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 5796614488071428412L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/AjouterJoueur.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Service<Joueur> service = new JoueurServiceImpl();
		
		String prenom = req.getParameter("prenom");
		String nom = req.getParameter("nom");
		int age = Integer.parseInt(req.getParameter("age"));
		String lieuNaissance = req.getParameter("lieu_naissance");
		float taille = Float.parseFloat(req.getParameter("taille"));
		float poids = Float.parseFloat(req.getParameter("poids"));
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
		
		service.save(joueur);

		resp.sendRedirect("/Roland-Garros/jm");
	}
	
}
