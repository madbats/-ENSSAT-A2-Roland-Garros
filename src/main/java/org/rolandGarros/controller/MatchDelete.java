package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
		if (req.getParameter("id")!=null) {
			Integer id = Integer.parseInt(req.getParameter("id"));
			Optional<Match> match = mdi.get(id);
			System.out.println(match.get().getIdMatch());
			mdi.delete(match.get());
		}
	}
}
