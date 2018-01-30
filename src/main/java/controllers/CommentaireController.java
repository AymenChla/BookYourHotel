package controllers;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;

import dao.ChambreRepository;
import dao.CommentaireRepository;
import dao.HotelRepository;
import dao.PrixRepository;
import dao.RatingRepository;
import dao.UserRepository;
import entities.Client;
import entities.Commentaire;
import entities.Hotel;
import entities.Prix;
import entities.User;

@Controller
public class CommentaireController {
	
	@Autowired
	private CommentaireRepository commentaireRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private PrixRepository prixRepository;
	
	@Autowired
	private ChambreRepository chambreRepository;
	
	@Autowired
	private RatingRepository ratingRepository;
	
	@RequestMapping(value="/savecomment" , method=RequestMethod.POST)
	public String saveComment(HttpServletRequest request,ModelMap model,@RequestParam("commmentaire") String commentaire)
	{
		HttpSession session = request.getSession();
		Long id_hotel = (Long) session.getAttribute("id_hotel");
		String date_d = (String) session.getAttribute("date_d");
		String date_f = (String) session.getAttribute("date_f");
		Hotel hotel = hotelRepository.getOne(id_hotel);
		
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		User user = userRepository.findByUserName(username);
		
		Commentaire comment = new Commentaire();
		System.out.println(commentaire);
		comment.setDateCommentaire(new Date());
		comment.setCommentaire(commentaire);
		comment.setHotel(hotel);
		comment.setUser(user);
		
		commentaireRepository.save(comment);
		
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
		
		
		//commentaire
		List<Commentaire> commentaires = commentaireRepository.getAllByHotel(id_hotel);
		model.put("commentaires", commentaires);
		

		//rating
		Float avgRating = ratingRepository.getAvgRatingByHotel(id_hotel);
		if(avgRating==null) avgRating = new Float(0);
		model.put("avgRating",avgRating);
		
		return "hebergements";
	}
	
	@RequestMapping(value="/removecomment" , method=RequestMethod.GET)
	public String removeComment(HttpServletRequest request,ModelMap model,Long id)
	{
		HttpSession session = request.getSession();
		Long id_hotel = (Long) session.getAttribute("id_hotel");
		String date_d = (String) session.getAttribute("date_d");
		String date_f = (String) session.getAttribute("date_f");
		
		
		commentaireRepository.delete(id);
		
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
		
		
		//commentaire
		List<Commentaire> commentaires = commentaireRepository.getAllByHotel(id_hotel);
		model.put("commentaires", commentaires);
		

		//rating
		Float avgRating = ratingRepository.getAvgRatingByHotel(id_hotel);
		if(avgRating==null) avgRating = new Float(0);
		model.put("avgRating",avgRating);
		
		return "hebergements";
	}
}
