package controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.ChambreRepository;
import dao.HotelRepository;
import dao.PrixRepository;
import dao.RatingRepository;
import dao.UserRepository;
import entities.Client;
import entities.Hotel;
import entities.Prix;
import entities.Rating;

@Controller
public class RatingController {

	@Autowired
	private PrixRepository prixRepository;
	
	@Autowired
	private ChambreRepository chambreRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private RatingRepository ratingRepository;
	
	@RequestMapping(value="/rating", method=RequestMethod.GET)
	public String rate(HttpServletRequest request,ModelMap model,Integer s)
	{
		HttpSession session = request.getSession();
		Long id_hotel = (Long) session.getAttribute("id_hotel");
		String date_d = (String) session.getAttribute("date_d");
		String date_f = (String) session.getAttribute("date_f");
		
		if(id_hotel == null ) return "redirect:/";
		
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
		
		
		//rating
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client client = (Client) userRepository.findByUserName(username);
		Hotel hotel = hotelRepository.findOne(id_hotel);
		Rating rate = ratingRepository.getRatingUserByHotel(client.getUserid(), id_hotel);
		if(rate==null)
		{
			rate = new Rating();
			rate.setClient(client); 
			rate.setHotel(hotel);
			rate.getHotel().setNbVote(rate.getHotel().getNbVote()+1);
		}
		
		
		rate.setNbEtoiles(s);
		ratingRepository.save(rate);
		
		//rating
		Float avgRating = ratingRepository.getAvgRatingByHotel(id_hotel);
		if(avgRating==null) avgRating = new Float(0);
		rate.getHotel().setAvgRating(avgRating);
		ratingRepository.save(rate);
		
		
		Long[] nbPerStar = new Long[5];
		for(int i=0; i < 5 ; i++)
		{
			Long var = ratingRepository.getHowManyRatedFor(i+1, id_hotel);
			if(var != null)
			{
				nbPerStar[i] = var;
			}
			else nbPerStar[i] = new Long(0);
		}
		model.put("nbPerStar", nbPerStar);
		
		return "hebergements";
	}
}
