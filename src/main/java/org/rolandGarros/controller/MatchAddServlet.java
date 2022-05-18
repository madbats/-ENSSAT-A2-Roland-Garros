package org.rolandGarros.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Match;
import org.rolandGarros.model.MatchServiceImpl;
import org.rolandGarros.model.Service;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mm/new")
public class MatchAddServlet extends jakarta.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		String pageName = "/AjouterMatch.jsp";

		Service<Joueur> joueurService = new JoueurServiceImpl();
		List<Joueur> listJoueurs = new ArrayList<Joueur>(joueurService.getAll());
		request.setAttribute("listJoueurs", listJoueurs);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		this.doProcess(request, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		int court = Integer.parseInt(request.getParameter("court"));
		String etape = request.getParameter("etape");
		int idj1 = Integer.parseInt(request.getParameter("idj1"));
		int idj2 = Integer.parseInt(request.getParameter("idj2"));
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		if(idj1==idj2) {
			request.setAttribute("message", "Les joueur 1 et 2 ne peuvent pas être les même");
			this.doProcess(request, resp);
		}else {
			Match match = new Match(court, etape, idj1, idj2,date);
			Service<Match> mdi = new MatchServiceImpl();
			
			if(mdi.save(match)!=-1) {
				resp.sendRedirect("/Roland-Garros/mm");
			}else {
				request.setAttribute("message", "Une erreur est survenue lors de l'ajout à la base de donnée");
				this.doProcess(request, resp);
			}
		}
	}
	
}
