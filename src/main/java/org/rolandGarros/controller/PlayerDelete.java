package org.rolandGarros.controller;

import java.io.IOException;
import java.util.Optional;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/jm/delete")
public class PlayerDelete extends jakarta.servlet.http.HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2940044520593524126L;
	private JoueurServiceImpl service = new JoueurServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));
		
		Optional<Joueur> j = service.get(id);
		Joueur joueur =  j.get();
		//try {
		service.delete(joueur);
		//}catch()
		resp.sendRedirect("/Roland-Garros/jm");
		
	}
}
