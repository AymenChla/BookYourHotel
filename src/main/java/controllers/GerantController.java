package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.ChambreRepository;
import dao.GerantRepository;
import dao.HotelRepository;
import dao.PrixRepository;
import dao.UserRepository;
import entities.Chambre;
import entities.Client;
import entities.Gerant;
import entities.Hotel;
import entities.Prix;

@Controller
public class GerantController {
	
	@Autowired
	GerantRepository gerantRepository;
	
	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	ChambreRepository chambreRepository;
	
	@Autowired
	PrixRepository prixRepository;
	
	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = "/updateHotel", method = RequestMethod.GET)
	public String showUpdateHotelPage(HttpServletRequest request, ModelMap model)
	{
		//Get User
		//Gerant gerant = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant gerant = (Gerant) userRepository.findByUserName(username);
		
		Hotel hotel = hotelRepository.findOne(gerant.getHotel().getIdHotel());
		model.put("hotel", hotel);
		return "updatehotel";
	}
	
	@RequestMapping(value="/updateHotel", method = RequestMethod.POST)
	public String showCreateAdminPage(@RequestParam("photo") MultipartFile multipartFile, ModelMap model, Hotel hotel, HttpServletRequest request) throws IllegalStateException, IOException
	{
		
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		String image = "";
		if (!multipartFile.isEmpty())
		{
			String extension = multipartFile.getOriginalFilename().split("\\.")[1];
			image = "/uploads/hotel_"+auth.getHotel().getIdHotel()+"."+extension;
			String filePath = request.getServletContext().getRealPath(image); 
			multipartFile.transferTo(new File(filePath));
			hotel.setImage(image);
		}
		
		
		hotelRepository.save(hotel);
		
		return "redirect:/updateHotel";
		
	}
	
	@RequestMapping(value="/createGerant",method = RequestMethod.GET)
	public String showCreateGerantPage(ModelMap model)
	{
		return "creategerant";
	}
	
	@RequestMapping(value="/createGerant",method = RequestMethod.POST)
	public String showCreateGerantPage(HttpServletRequest request,ModelMap model, Gerant gerant)
	{
		//Get User
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		gerant.setHotel(auth.getHotel());
		gerantRepository.save(gerant);
		model.put("status", "ok");
		return "creategerant";
	}
	
	@RequestMapping(value="/addChambres",method = RequestMethod.GET)
	public String showAddChambresPage(ModelMap model)
	{
		return "addchambres";
	}
	
	@RequestMapping(value="/addChambres",method = RequestMethod.POST)
	public String showAddChambresPage(@RequestParam("image") MultipartFile multipartFile,HttpServletRequest request,ModelMap model, Chambre chambre, @RequestParam("nombre") Integer nombre) throws IllegalStateException, IOException
	{
		//Get User
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		String image="";
		if (!multipartFile.isEmpty())
		{
			String extension = multipartFile.getOriginalFilename().split("\\.")[1];
			image = "/uploads/hotel_"+auth.getHotel().getIdHotel()+"_"+chambre.getCategorie()+"."+extension;
			String filePath = request.getServletContext().getRealPath(image); 
			multipartFile.transferTo(new File(filePath));
		}
		
		
		Hotel hotel = new Hotel(hotelRepository.findOne((long) auth.getHotel().getIdHotel()));
		chambre.setHotel(auth.getHotel());
		for (int i=0 ; i<nombre ; i++)
		{
			Chambre add = new Chambre(chambre);
			add.setNumero(hotel.getNbChambres() + i + 1);
			add.setPhoto(image);
			add = chambreRepository.save(add);
			
		}
		hotel.setNbChambres(hotel.getNbChambres() + nombre);
		hotelRepository.save(hotel);
		model.put("status", nombre);
		return "addchambres";
	}
	
	//Display Chambres

	@RequestMapping(value="/chambres",method = RequestMethod.GET)
	public String showChambresPage(HttpServletRequest request,ModelMap model)
	{
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		List<Chambre> chambres = chambreRepository.findByIdHotel(auth.getHotel().getIdHotel());
		model.put("chambres", chambres);
		return "chambres";
	}
	
	@RequestMapping(value="/chambres", method = RequestMethod.POST)
	public String showChambrePage(@RequestParam("image") MultipartFile multipartFile, ModelMap model, Chambre chambre, HttpServletRequest request) throws IllegalStateException, IOException
	{
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
			
		String image = "";
		if (!multipartFile.isEmpty())
		{
			String extension = multipartFile.getOriginalFilename().split("\\.")[1];
			image = "/uploads/hotel_"+auth.getHotel().getIdHotel()+"_"+chambre.getIdChambre()+"."+extension;
			String filePath = request.getServletContext().getRealPath(image); 
			multipartFile.transferTo(new File(filePath));
			chambre.setPhoto(image);
		}
		
		
		
		chambre.setHotel(auth.getHotel());
		chambreRepository.save(chambre);
		
		return "redirect:/updateChambre?id="+chambre.getIdChambre();
		
	}
	
	//Delete Chambres
	
	@RequestMapping(value="/deleteChambres",method = RequestMethod.POST)
	public String deleteChambresPage(ModelMap model, HttpServletRequest request)
	{
		String[] ids = request.getParameterValues("chambres");
		for (String id : ids)
		{
			chambreRepository.delete(Long.parseLong(id));
		}
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		List<Chambre> chambres = chambreRepository.findByIdHotel(auth.getHotel().getIdHotel());
		model.put("chambres", chambres);
		return "chambres";
	}
	
	//Update Chambre
	
	@RequestMapping(value="/updateChambre",method = RequestMethod.GET)
	public String showChambrePage(ModelMap model, Long id)
	{
		Chambre chambre = chambreRepository.findOne(id);
		model.put("chambre", chambre);
		return "updatechambre";
	}
	
	
	
	//Prix
	@RequestMapping(value="/prix",method = RequestMethod.GET)
	public String showPrixPage(HttpServletRequest request,ModelMap model)
	{
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		List<Prix> prix = prixRepository.getAllPrix(auth.getHotel().getIdHotel());
		//List<Prix> prix = prixRepository.getPrixByTypeByPeriode(auth.getHotel().getIdHotel());
		prix = Prix.supprimerDoublonsChambreCategorie(prix);
		model.put("prix", prix);
		return "prix";
	}
	
	@RequestMapping(value="/addPrix",method = RequestMethod.GET)
	public String showAddPrixPage(ModelMap model)
	{
		return "addprix";
	}
	
	@RequestMapping(value="/addPrix",method = RequestMethod.POST)
	public String showAddPrixPage(HttpServletRequest request,ModelMap model, @RequestParam("type") Integer type, Prix prix)
	{
		//Get User
		//Gerant auth = gerantRepository.findOne((long) 2);
		//client authentified
		String username = request.getRemoteUser();
		Gerant auth = (Gerant) userRepository.findByUserName(username);
		
		Hotel hotel = new Hotel(hotelRepository.findOne((long) auth.getHotel().getIdHotel()));
		List<Chambre> chambres = chambreRepository.findByType(hotel.getIdHotel(), type);
		for (Chambre chambre : chambres)
		{
			Prix newPrice = new Prix(prix);
			newPrice.setChambre(chambre);
			prixRepository.save(newPrice);
		}
		model.put("status", type);
		return "addprix";
	}
	
}
