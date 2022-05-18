package org.rolandGarros.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
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

@WebServlet("/mm/update")
public class MatchUpdate extends jakarta.servlet.http.HttpServlet {

	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Service<Match> mService = new MatchServiceImpl();
		Service<Joueur> jService = new JoueurServiceImpl();
		Optional<Match> op = mService.get(id);
		if (op.isEmpty()) {
			request.setAttribute("message", "Le match n'existe pas");
		} else {
			Match match = op.get();
			request.setAttribute("match", match);
		}

		String pageName = "/ModifierMatch.jsp";

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
		Integer id = Integer.parseInt(request.getParameter("id"));
		Service<Match> mService = new MatchServiceImpl();
		Optional<Match> op = mService.get(id);
		if (op.isEmpty()) {
			request.setAttribute("message", "Le match n'existe pas");
			this.doProcess(request, resp);
			return;
		}
		Match match = op.get();
		int nombreDeSet = match.getSets().size()+1;
		if (nombreDeSet < 2) {
			int duree = Integer.parseInt(request.getParameter("duree").substring(0, 2)) * 3600;
			duree += Integer.parseInt(request.getParameter("duree").substring(3, 5)) * 60;

			if (duree < 0) {
				request.setAttribute("message", "La duree d'un matche ne peut pas être négatif");
				this.doProcess(request, resp);
				return;
			}

			match.setDureeSecondes(duree);

			mService.update(match);
			match = mService.get(id).get();

			mService.update(match);

			int set1Sc1 = Integer.parseInt(request.getParameter("set1-sc1"));
			int set1Sc2 = Integer.parseInt(request.getParameter("set1-sc2"));
			if (((set1Sc1 - set1Sc2) < 2 && (set1Sc2 - set1Sc1) < 2) || (set1Sc1 < 6 && set1Sc2 < 6)) {
				request.setAttribute("message", "Le score des joueurs au set 1 n'est pas valide");
				this.doProcess(request, resp);
				return;
			}
			int set2Sc1 = Integer.parseInt(request.getParameter("set2-sc1"));
			int set2Sc2 = Integer.parseInt(request.getParameter("set2-sc2"));
			if (((set2Sc1 - set2Sc2) < 2 && (set2Sc2 - set2Sc1) < 2) || (set2Sc1 < 6 && set2Sc2 < 6)) {
				request.setAttribute("message", "Le score des joueurs au set 2 n'est pas valide");
				this.doProcess(request, resp);
				return;
			}
			Set set1 = new Set(id, set1Sc1, set1Sc2, 1);
			Set set2 = new Set(id, set2Sc1, set2Sc2, 2);

			Service<Set> sService = new SetServiceImpl();
			sService.save(set1);
			sService.save(set2);

			resp.sendRedirect("/Roland-Garros/mm");
		}else {
			int setSc1 = Integer.parseInt(request.getParameter("set-sc1"));
			int setSc2 = Integer.parseInt(request.getParameter("set-sc2"));
			if (((setSc1 - setSc2) < 2 && (setSc2 - setSc1) < 2) || (setSc1 < 6 && setSc2 < 6)) {
				request.setAttribute("message", "Le score des joueurs au set "+nombreDeSet+" n'est pas valide");
				this.doProcess(request, resp);
				return;
			}
			Set set = new Set(id, setSc1, setSc2, nombreDeSet);

			Service<Set> sService = new SetServiceImpl();
			sService.save(set);
			this.doProcess(request, resp);
		}
	}
}
