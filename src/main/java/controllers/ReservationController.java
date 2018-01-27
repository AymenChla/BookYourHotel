package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ChambreRepository;
import dao.ClientRepository;
import dao.PrixRepository;
import dao.ReservationRepository;
import dao.ResidentRepository;
import dao.UserRepository;
import entities.Chambre;
import entities.Client;
import entities.Prix;
import entities.Resident;
import entities.Reservation;

@Controller
@Transactional
public class ReservationController {
	
	@Autowired
	private ResidentRepository residentRepository; 
	
	@Autowired
	private ChambreRepository chambreRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private PrixRepository prixRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/reservation")
	public String BeforeReservation(HttpServletRequest request,ModelMap model, String categorie ,Integer nbChambre,Long id_offre)
	{
		HttpSession session = request.getSession();
		session.setAttribute("categorie", categorie);
		session.setAttribute("nbChambre", nbChambre);
		session.setAttribute("id_offre",id_offre);
		
		
		Prix offre = prixRepository.getOne(id_offre);
		model.put("offre", offre);
		return "reservation";
	}
	
	@RequestMapping(value="/n_reservation" , method = RequestMethod.POST)
	public String Reservation(HttpServletRequest request,ModelMap model,Resident resident,String type_resident) throws ParseException
	{
		HttpSession session = request.getSession();
		Integer nbChambre = (Integer) session.getAttribute("nbChambre");
		Long id_hotel = (Long) session.getAttribute("id_hotel");
		String categorie = (String) session.getAttribute("categorie");
		String date_d = (String) session.getAttribute("date_d");
		String date_f = (String) session.getAttribute("date_f");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date_debut_sejour = formatter.parse(date_d);
		Date date_fin_sejour = formatter.parse(date_f);
		
	
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client client = (Client) userRepository.findByUserName(username);
		
		if(type_resident.equals("other"))
		{
			
			//save resident 
			resident = residentRepository.save(resident);
					
		}
		else{
			
			//save resident
			resident = new Resident(client.getNom(), client.getPrenom(), client.getCin(), client.getTel(),client.getDateNaissance());
			resident = residentRepository.save(resident);
		}
		
		//get une chambre
		Chambre chambre = chambreRepository.getOneChambreDispoByType(categorie, id_hotel, date_d, date_f);
		
		//save reservation
		Reservation reservation = new Reservation(date_debut_sejour, date_fin_sejour, false);
		reservation.setChambre(chambre);
		reservation.setResident(resident);
		reservation.setClient(client);
		Double prix = prixRepository.getPrixByIdChambre(chambre.getIdChambre(),date_d);
		reservation.setPrix_reservation(prix);
		reservationRepository.save(reservation);
		
		//nouveau nbCHambre
		nbChambre--;
		session.setAttribute("nbChambre", nbChambre);
		
		//recuperer information a afficher 
		Long id_offre = (Long) session.getAttribute("id_offre");
		Prix offre = prixRepository.getOne(id_offre);
		model.put("offre", offre);
		return "reservation";
	}
	
	
	
	@RequestMapping(value="/mesreservations")
	public String viewMesReservations(HttpServletRequest request,ModelMap model)
	{
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client client = (Client) userRepository.findByUserName(username);
		
		List<Reservation> reservations = reservationRepository.getReservationsByIdCLient(client.getUserid());
		model.put("reservations", reservations);
		return "mesreservations";
	}
	
}
