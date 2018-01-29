package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javassist.compiler.ast.Pair;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.ChambreRepository;
import dao.HotelRepository;
import dao.PrixRepository;
import entities.Chambre;
import entities.Hotel;
import entities.Prix;


@Controller
public class RechercheController {
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private ChambreRepository chambreRepository;
	
	@Autowired
	private PrixRepository prixRepository;
	
	@RequestMapping(value="/rechercheOffres",method=RequestMethod.POST)
	public String rechercheOffres(HttpServletRequest request,ModelMap model,@RequestParam String dest,@RequestParam String date_debut,@RequestParam String date_fin,@RequestParam int nbChambre)
	{	
		
		HttpSession session = request.getSession();
		
		List<Prix> offres =  prixRepository.getAllAvailableOffers(dest, date_debut, date_fin,nbChambre);
		offres = Prix.supprimerDoublonsHotel(offres);
		model.put("offres",offres);
		
		session.setAttribute("date_d", date_debut);
		session.setAttribute("date_f", date_fin);
		
		return "home";
	}
	
	@RequestMapping(value="/hebergements",method=RequestMethod.POST)
	public String hebergements(HttpServletRequest request,ModelMap model,@RequestParam Long id_hotel)
	{
		HttpSession session = request.getSession();
		String date_d = (String) session.getAttribute("date_d");
		String date_f = (String) session.getAttribute("date_f");
		session.setAttribute("id_hotel", id_hotel);
	
		
		//tout offres dipos dans l'hotel pour la reservation
		List<Prix> offres = prixRepository.getAllAvailableOffersByIdHotel(id_hotel, date_d, date_f);
		
		//supprimer doublons hotels (pour affichers une seule fois la categorie simple,double...)
		offres = Prix.supprimerDoublonsChambreCategorie(offres);
	
		//map pour compter nombre chambre dispo par categorie(simple,double...) chambre
		Map<Integer,Integer> nbChambresDispo = new HashMap<Integer,Integer>();
		for (Prix o : offres) {
			nbChambresDispo.put(o.getChambre().getType(), chambreRepository.getNbChambreDispoByType(o.getChambre().getType(), id_hotel, date_d, date_f));
		}
		model.put("offres",offres);
		model.put("nbChambres", nbChambresDispo);
		
		return "hebergements";
	}
}
