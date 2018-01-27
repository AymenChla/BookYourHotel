package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.GerantRepository;
import dao.HotelRepository;
import entities.Gerant;
import entities.Hotel;

@Controller
public class GerantController {
	
	@Autowired
	GerantRepository gerantRepository;
	
	@Autowired
	HotelRepository hotelRepository;

	@RequestMapping(value = "/updateHotel", method = RequestMethod.GET)
	public String showUpdateHotelPage(ModelMap model)
	{
		//Get User
		Gerant gerant = gerantRepository.findOne((long) 4);
		Hotel hotel = hotelRepository.findOne(gerant.getHotel().getIdHotel());
		model.put("hotel", hotel);
		return "gerant/updatehotel";
	}
	
	@RequestMapping(value="/updateHotel", method = RequestMethod.POST)
	public String showCreateAdminPage(@RequestParam("photo") MultipartFile multipartFile, ModelMap model, Hotel hotel, HttpServletRequest request) throws IllegalStateException, IOException
	{
		String filePath = request.getServletContext().getRealPath("/"); 
		multipartFile.transferTo(new File(filePath));
		
		hotelRepository.save(hotel);
		model.put("status", "ok");
		return "gerant/updatehotel";
		
	}
	
	@RequestMapping(value="/createGerant",method = RequestMethod.GET)
	public String showCreateGerantPage(ModelMap model)
	{
		return "gerant/creategerant";
	}
	
	@RequestMapping(value="/createGerant",method = RequestMethod.POST)
	public String showCreateGerantPage(ModelMap model, Gerant gerant)
	{
		//Get User
		Gerant auth = gerantRepository.findOne((long) 2);
		gerant.setHotel(auth.getHotel());
		gerantRepository.save(gerant);
		model.put("status", "ok");
		return "gerant/creategerant";
	}
	
	
	
}
