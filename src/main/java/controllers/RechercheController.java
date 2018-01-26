package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.compiler.ast.Pair;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String rechercheOffres(ModelMap model,@RequestParam String dest,@RequestParam String date_debut,@RequestParam String date_fin,@RequestParam int nbChambre)
	{
		
		List<Prix> offres =  prixRepository.getAllAvailableOffers(dest, date_debut, date_fin,nbChambre);
		offres = Prix.supprimerDoublonsHotel(offres);
		model.put("offres",offres);
		model.put("date_d", date_debut);
		model.put("date_f", date_fin);
		
		return "offers";
	}
	
	@RequestMapping(value="/hebergements",method=RequestMethod.POST)
	public String hebergements(ModelMap model,@RequestParam Long id_hotel,@RequestParam String date_d,@RequestParam String date_f)
	{
		//tout les chambres dipos dans l'hotel pour la reservation
		List<Prix> offres = prixRepository.getAllAvailableOffersByIdHotel(id_hotel, date_d, date_f);
		
		//supprimer doublons hotels (pour affichers une seule fois la categorie simple,double...)
		offres = Prix.supprimerDoublonsChambreCategorie(offres);
	
		//map pour compter nombre chambre dispo par categorie(simple,double...) chambre
		Map<String,Integer> nbChambresDispo = new HashMap<String,Integer>();
		for (Prix o : offres) {
			nbChambresDispo.put(o.getChambre().getDescription(), chambreRepository.getNbChambreDispoByType(o.getChambre().getDescription(), id_hotel, date_d, date_f));
		}
		model.put("offres",offres);
		System.out.println(nbChambresDispo.get("chambre simple"));
		model.put("nbChambres", nbChambresDispo);
		
		return "hebergements";
	}
}
