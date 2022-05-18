package org.rolandGarros.controller;

import java.io.IOException;
import java.util.Optional;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PlayerUpdate")
public class PlayerUpdate extends jakarta.servlet.http.HttpServlet{
	private static final long serialVersionUID = -3523204746934429580L;
	private Service<Joueur> service = new JoueurServiceImpl();
	private int id;
	private Joueur joueur;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/ModifierJoueur.jsp";
		
		id = Integer.parseInt(req.getParameter("id"));
		
		Optional<Joueur> j = service.get(id);
		if(j.isEmpty()) {
			req.setAttribute("message", "Le joueur n'existe pas");
		}else {
			joueur =  j.get();
			
			req.setAttribute("joueur", joueur);
			
		}
		
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
		joueur.setPrenom(req.getParameter("prenom"));
		joueur.setNom(req.getParameter("nom"));
		joueur.setAge(Integer.parseInt(req.getParameter("age")));
		joueur.setLieuNaissance(req.getParameter("lieu_naissance"));
		joueur.setTaille(Float.parseFloat(req.getParameter("taille")));
		joueur.setPoids(Float.parseFloat(req.getParameter("poids")));
		joueur.setNationnalite(req.getParameter("nationnalite"));
		joueur.setDebutCarriere(Integer.parseInt(req.getParameter("debut_carriere")));
		joueur.setMain(req.getParameter("main"));
		joueur.setClassement(Integer.parseInt(req.getParameter("classement")));
		joueur.setEntraineur(req.getParameter("entraineur"));
		joueur.setSalaire(Integer.parseInt(req.getParameter("salaire")));
		joueur.setVictoires(Integer.parseInt(req.getParameter("victoires")));
		joueur.setDefaites(Integer.parseInt(req.getParameter("defaites")));
		joueur.setCategorie(req.getParameter("categorie"));
		
		//System.out.println(joueur);
		service.update(joueur);

		resp.sendRedirect("/Roland-Garros/EditJoueurs");
		
	}
}
