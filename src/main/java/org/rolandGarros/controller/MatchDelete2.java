package org.rolandGarros.controller;

import java.io.IOException;
import java.util.Optional;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MatchDelete2")
public class MatchDelete2 extends jakarta.servlet.http.HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/SupprimerMatch2.jsp";
		Integer id = Integer.parseInt(req.getParameter("id"));
		Service<Match> matchService = new MatchServiceImpl();
		Optional<Match> m = matchService.get(id);
		Match match = null;
		if (m.isEmpty()) {
			
		}else {
			match = m.get();
		}
		req.setAttribute("match", match);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
