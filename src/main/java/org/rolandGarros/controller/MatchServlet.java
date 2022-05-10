package org.rolandGarros.controller;

import java.io.IOException;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MatchServlet")
public class MatchServlet extends jakarta.servlet.http.HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/GestionMatch.jsp";
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
		int duree = Integer.parseInt(req.getParameter("duree"));
		int court = Integer.parseInt(req.getParameter("court"));
		String etape = req.getParameter("etape");
		int idj1 = Integer.parseInt(req.getParameter("idj1"));
		int idj2 = Integer.parseInt(req.getParameter("idj2"));
		
		Match match = new Match(duree, court, etape, idj1, idj2);
		//System.out.println(match);
		MatchDAOImpl mdi = new MatchDAOImpl();
		mdi.save(match);
		doGet(req, resp);
	}
}
