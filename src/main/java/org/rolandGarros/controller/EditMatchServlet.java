package org.rolandGarros.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mm")
public class EditMatchServlet extends jakarta.servlet.http.HttpServlet{
	
	private static final long serialVersionUID = -116366986475057828L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Service<Match> mdi = new MatchServiceImpl();
		List<Match> listMatchs = new ArrayList<Match>(mdi.getAll());
		req.setAttribute("listMatchs", listMatchs);
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
	
}
