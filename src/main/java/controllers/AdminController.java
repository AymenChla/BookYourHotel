package controllers;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.AdminRepository;
import dao.GerantRepository;
import dao.HotelRepository;
import entities.Admin;
import entities.Gerant;
import entities.Hotel;


@Controller
//@SessionAttributes("adminEmail")
public class AdminController {
	
	@Autowired
	AdminRepository adminRepository;
	
	
	
	@RequestMapping(value="/createadmin",method = RequestMethod.GET)
	public String showCreateAdminPage(ModelMap model)
	{
		return "createadmin";
	}
	
	@RequestMapping(value="/createadmin",method = RequestMethod.POST)
	public String showCreateAdminPage(ModelMap model,Admin admin)
	{
		admin.setRole("ROLE_ADMIN");
		adminRepository.save(admin);
		model.put("status", "ok");
		return "createadmin";
	}
	
	/* --- */
	
	@Autowired
	HotelRepository hotelRepository;
	
	@Autowired
	GerantRepository gerantRepository;
	
	//Création d'hotel et d'un compte gérant
	@RequestMapping(value="/createhotel",method = RequestMethod.GET)
	public String showCreateHotelGerantPage(ModelMap model)
	{
		return "createhotel";
	}
	
	@RequestMapping(value="/createhotel",method = RequestMethod.POST)
	public String showCreateHotelGerantPage(ModelMap model, Hotel hotel, Gerant gerant)
	{
		hotelRepository.save(hotel);
		gerant.setHotel(hotel);
		gerantRepository.save(gerant);
		model.put("status", "ok");
		return "createhotel";
	}
	
	//Display hotels

	@RequestMapping(value="/hotels",method = RequestMethod.GET)
	public String showHotelsPage(ModelMap model)
	{
		List<Hotel> hotels = hotelRepository.findAll();
		model.put("hotels", hotels);
		return "hotels";
	}
	
	//Delete Hotels
	
	@RequestMapping(value="/deleteHotels",method = RequestMethod.POST)
	public String deleteHotelsPage(ModelMap model, HttpServletRequest request)
	{
		String[] ids = request.getParameterValues("hotels");
		for (String id : ids)
		{
			hotelRepository.delete(Long.parseLong(id));
		}
		List<Hotel> hotels = hotelRepository.findAll();
		model.put("hotels", hotels);
		return "hotels";
	}
	
	/* --- */
	
}