package org.rolandGarros.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchDAOImpl;
import org.rolandGarros.model.MatchServiceImpl;
import org.rolandGarros.model.Service;
import org.rolandGarros.model.Set;
import org.rolandGarros.model.SetServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MatchUpdate")
public class MatchUpdate extends jakarta.servlet.http.HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageName = "/ModifierMatch.jsp";
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
		
	}
}
