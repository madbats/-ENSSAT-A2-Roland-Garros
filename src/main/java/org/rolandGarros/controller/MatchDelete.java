package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MatchDelete")
public class MatchDelete extends jakarta.servlet.http.HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/SupprimerMatch.jsp";
		MatchDAOImpl mdi = new MatchDAOImpl();
		List<Match> listMatch = (List<Match>) mdi.getAll();
		req.setAttribute("listMatch", listMatch);
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
		MatchDAOImpl mdi = new MatchDAOImpl();
		ArrayList<Match> m = (ArrayList<Match>) mdi.getAll();
		System.out.println(m);
	}
}
