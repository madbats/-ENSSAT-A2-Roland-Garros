package org.rolandGarros.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Service;

/**
 * Servlet implementation class AfficheJoueurServlet
 */
@WebServlet("/joueur")
public class AfficheJoueurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageName="/AfficheJoueur.jsp";
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		Service<Joueur> joueurService = new JoueurServiceImpl();
		Optional<Joueur> j = joueurService.get(id);
		if (j.isEmpty())//On gère le cas où le joueur demandé n'est pas trouvé dans la base de donnée
		{
			request.setAttribute("error", "Le joueur n'a pas été renseigné!");
			//On ajoute un attribut "error" à la requête pour indiquer l'échec de l'acquisition du joueur demandé
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
			try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {//Si le joueur a été récupéré dans la base de donnée
			request.setAttribute("error", null);
			
			Joueur joueur = j.get();
			request.setAttribute("joueur",joueur);//On met le joueur dans la requête
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
			try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
