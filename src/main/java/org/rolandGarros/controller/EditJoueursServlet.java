package org.rolandGarros.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.rolandGarros.model.Joueur;
import org.rolandGarros.model.JoueurServiceImpl;
import org.rolandGarros.model.Service;

import com.opencsv.exceptions.CsvValidationException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/jm")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class EditJoueursServlet extends HttpServlet {

	private static final long serialVersionUID = 2783196248594064686L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sort = request.getParameter("sort");
		sort = (sort!=null)? sort:"nom";
		Service<Joueur> joueurService = new JoueurServiceImpl();
		List<Joueur> listJoueurs = new ArrayList<Joueur>(joueurService.getAll());
		
		switch(sort) {
			case "nom": listJoueurs.sort((j1,j2)->nomComparerer(j1,j2));
				break;
			case "classement": listJoueurs.sort((j1,j2)->classementComparerer(j1,j2));
			break;
			case "sexe": listJoueurs.sort((j1,j2)->sexComparerer(j1,j2));
			break;
			case "victoire": listJoueurs.sort((j1,j2)->victoireComparerer(j1,j2));
			break;
			case "duree": listJoueurs.sort((j1,j2)->dureeComparerer(j1,j2));
			break;
		}
        String pageName="/EditJoueur.jsp";
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		
		Part filePart = request.getPart("file");
	    String fileName = filePart.getSubmittedFileName();
	    
	    for (Part part : request.getParts()) {
	      part.write("C:\\upload\\" + fileName);
	    }
	    
		int compter = 1;
		try {
			List<Map<String,String>> csv = (new MyCSVReader()).readCSV("C:\\upload\\" + fileName);
			Service<Joueur> service = new JoueurServiceImpl();
			for (Map<String,String> csvJoueur : csv) {
				
				String prenom = csvJoueur.get("prénom");

				String nom = csvJoueur.get("nom");

				int age = Integer.parseInt(csvJoueur.get("age"));

				String lieuNaissance = csvJoueur.get("pays");
				String nationnalite = csvJoueur.get("pays");
				String main = (csvJoueur.get("main").contains("d"))? "Droite": "Gauche";
				int classement = Integer.parseInt(csvJoueur.get("classement mondial"));
				
				
				String categorie = (csvJoueur.get("catégorie").contains("h"))? "H":"F";	
				
				Joueur joueur = new Joueur(prenom, nom, age, lieuNaissance, nationnalite, main, classement, categorie);
				
				if(service.save(joueur)==-1) {
					request.setAttribute("message", "L'insertion du "+compter+" joueur a échoué");
					this.doProcess(request, resp);
					return;
				}
				compter++;
			}

		} catch (CsvValidationException e) {
			request.setAttribute("message", "Le fichier csv ne peut pas être lut");
			
			e.printStackTrace();
		} catch (IOException e) {
			request.setAttribute("message", "Le fichier ne peut pas être lut");
			
			e.printStackTrace();
		}finally {
			this.doProcess(request, resp);
		}
		
	}
	
	private int nomComparerer(Joueur j1, Joueur j2) {
		return j1.getNom().compareTo(j2.getNom());
	}
	private int classementComparerer(Joueur j1, Joueur j2) {
		return j1.getClassement() - j2.getClassement();
	}
	private int sexComparerer(Joueur j1, Joueur j2) {
		return j1.getCategorie().compareTo(j2.getCategorie());
	}
	private int victoireComparerer(Joueur j1, Joueur j2) {
		return j1.getVictoires() - j2.getVictoires();
	}	
	private int dureeComparerer(Joueur j1, Joueur j2) {
		return j1.getMatchs().stream().mapToInt(m->m.getDureeSecondes()).sum() - j2.getMatchs().stream().mapToInt(m->m.getDureeSecondes()).sum();
	}
	
}
