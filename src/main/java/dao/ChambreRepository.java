package dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import entities.Chambre;;

public interface ChambreRepository extends JpaRepository<Chambre, Long>{
	
	//@Query("from Hotel where adresse like '%?%' and idHotel in(Select idHotel from Chambre where )")
	@Query("from Chambre where hotel.idHotel=1 ")
	public List<Chambre> rechercherCHambre();
	
	
	@Query(value="select * from chambres c natural join reservations r where ?1 not BETWEEN r.date_debut_sejour and r.date_fin_sejour and ?2 not BETWEEN r.date_debut_sejour and r.date_fin_sejour", nativeQuery=true)
	public List<Chambre> getAvailableChambres(Date date_debut_sejour,Date date_fin_sejour);
}
