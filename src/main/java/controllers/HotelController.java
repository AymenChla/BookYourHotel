package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.HotelRepository;
import entities.Hotel;


@Controller
public class HotelController {
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@RequestMapping(value="/rechercheOffres",method=RequestMethod.POST)
	public String rechercheOffres(ModelMap model,@RequestParam String dest,@RequestParam String date_debut,@RequestParam String date_fin,@RequestParam Integer nbChambre) throws ParseException
	{
	
		List<Hotel> hotels = hotelRepository.getAvailableHotels(dest,date_debut,date_fin,nbChambre);
		model.put("hotels", hotels);
		
		return "offers";
	}
}
