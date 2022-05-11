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
		// TODO Auto-generated method stub
		String pageName="/AfficheJoueur.jsp";
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		Service<Joueur> joueurService = new JoueurServiceImpl();
		Optional<Joueur> j = joueurService.get(id);
		Joueur joueur = null;
		if (j.isEmpty())
		{
			request.setAttribute("error", "Le joueur n'a pas été renseigné!");
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
			try {
				rd.forward(request,response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			joueur = j.get();
			request.setAttribute("joueur",joueur);
			
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
