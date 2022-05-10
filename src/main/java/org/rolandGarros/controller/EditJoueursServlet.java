package org.rolandGarros.controller;

import java.awt.print.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.rolandGarros.model.Joueur;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/EditJoueurs")
public class EditJoueursServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		List<String> searchHistory = (List<String>)session.getAttribute("SearchHistory");
//		if (searchHistory == null) {
//			searchHistory = new ArrayList<String>();
//			session.setAttribute("SearchHistory", searchHistory);
//		}
		
		Service<Joueur> joueurService = new JoueurServiceImpl();
		// String searchText = request.getParameter("searchText");
		List<Joueur> listJoueurs = new ArrayList<Joueur>(joueurService.getAll());
				
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
	
	private int nomComparerer(Joueur j1, Joueur j2) {
		return j1.getNom().compareTo(j2.getNom());
	}
	private int classementComparerer(Joueur j1, Joueur j2) {
		return j1.getClassement() - j2.getClassement();
	}
	private int sexComparerer(Joueur j1, Joueur j2) {
		return j1.getCategorie().compareTo(j2.getCategorie());
	}
}
