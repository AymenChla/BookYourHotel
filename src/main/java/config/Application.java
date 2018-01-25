package config;


import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import dao.AdminRepository;
import dao.ChambreRepository;
import dao.HotelRepository;
import entities.Admin;
import entities.Chambre;
import entities.Hotel;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "dao")
@EntityScan(basePackages = "entities")
public class Application extends  SpringBootServletInitializer implements CommandLineRunner{

	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	

	@Autowired
	private ChambreRepository chambreRepository;
	
    public static void main(String[] args) throws Throwable {
        SpringApplication.run(Application.class, args);
    }

	@Override
	public void run(String... arg0) throws Exception {
		
		//adminRepository.save(new Admin("aymen.chla@gmail.com","azerty"));
		//List<Hotel> hotels = hotelRepository.getAvailableHotels("OUI casaBALNCA");
		//for (Hotel hotel : hotels) {
			//System.out.println(hotel.getAdresse());
		//}
		
		
		//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//java.util.Date date_d = formatter.parse("2018-01-06");
		//java.util.Date date_f = formatter.parse("2018-01-14");
		//List<Hotel> hotels = hotelRepository.getAvailableHotels("casa",date_d,date_f);
		//for (Hotel hotel : hotels) {
			//System.out.println(hotel.getAdresse());
		//}
	}
    
    
    
    
}