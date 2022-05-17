package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MatchesServlet
 */
@WebServlet("/matchs")
public class MatchesServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		Service<Match> matchService = new MatchServiceImpl();
		List<Match> listMatchs = new ArrayList<Match>(matchService.getAll());
        String pageName="/matchs.jsp";
        request.setAttribute("listMatchs", listMatchs);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
        try {
              rd.forward(request, response);
        } catch (ServletException e) {
              e.printStackTrace();
        } catch (IOException e) {
              e.printStackTrace();
        }
	}

}
