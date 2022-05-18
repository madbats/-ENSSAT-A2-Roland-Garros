package org.rolandGarros.controller;

import java.io.IOException;
import java.util.Optional;

import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mm/delete")
public class MatchDelete extends jakarta.servlet.http.HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Service<Match> mdi = new MatchServiceImpl();
		mdi.delete(mdi.get(id).get());
		resp.sendRedirect("/Roland-Garros/mm");
		
	}
}
