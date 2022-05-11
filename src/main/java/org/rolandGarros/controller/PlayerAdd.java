package org.rolandGarros.controller;

import java.io.Console;
import java.io.IOException;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.controller.JoueurServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PlayerAdd")
public class PlayerAdd extends jakarta.servlet.http.HttpServlet {
	private JoueurServiceImpl service = new JoueurServiceImpl();
	
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
		int id = Integer.parseInt(req.getParameter("id"));
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
		
		Joueur joueur = new Joueur(id, prenom, nom, age, lieuNaissance, taille, poids, nationnalite, debutCarriere, main, classement, entraineur, salaire, victoires, defaites, categorie);
		System.out.println(joueur);
		
		service.save(joueur);
		
	}
	
}
