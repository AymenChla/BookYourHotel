package dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import entities.Hotel;

public interface HotelRepository extends JpaRepository<Hotel, Long>{
	
	//@Query("from Hotel where adresse like '%?%' and idHotel in(Select idHotel from Chambre where )")
	@Query("from Hotel where adresse like %?1% ")
	public List<Hotel> getHotelsLikeAdresse(String adresse);
	

	@Query(value = "SELECT * FROM hotels WHERE adresse like %?1% and id_hotel in (select id_hotel from chambres c natural join reservations r where ?2 not BETWEEN r.date_debut_sejour and r.date_fin_sejour and ?3 not BETWEEN r.date_debut_sejour and r.date_fin_sejour group by id_hotel having count(id_hotel) >= ?4 ) ", nativeQuery = true)
	public List<Hotel> getAvailableHotels(String adresse,String date_debut_sejour,String date_fin_sejour,Integer nbChambre);
	
	
	

}
