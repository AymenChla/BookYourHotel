package dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import entities.Prix;

public interface PrixRepository extends JpaRepository<Prix, Long>{
	
	
	//les offres (prix->chambre->hotel) disponible pour la réservation
	@Query(value="select * from hotels h NATURAL join chambres c NATURAL join prix p WHERE h.id_hotel in ( select id_hotel from prix p NATURAL join chambres c NATURAL join hotels h WHERE h.adresse_hotel like %?1% AND p.id_chambre not in( select r.id_chambre from reservations r where ?2 BETWEEN r.date_debut_sejour and r.date_fin_sejour or ?3 BETWEEN r.date_debut_sejour and r.date_fin_sejour or ( ?2 < r.date_debut_sejour and ?3 > r.date_fin_sejour) and ?2 BETWEEN p.date_debut and p.date_fin ) and ?2 BETWEEN p.date_debut and p.date_fin group by id_hotel HAVING COUNT(id_hotel)>=?4 ) and ?2 BETWEEN p.date_debut and p.date_fin",nativeQuery=true)
	public List<Prix> getAllAvailableOffers(String dest, String date_d, String date_f,int nbChambre);
	
	//les offres (prix->chambre->hotel) disponible pour la réservation
	@Query(value="select * from hotels h NATURAL join chambres c NATURAL join prix p WHERE h.id_hotel in ( select id_hotel from prix p NATURAL join chambres c NATURAL join hotels h WHERE h.id_hotel=?1 AND p.id_chambre not in( select r.id_chambre from reservations r where ?2 BETWEEN r.date_debut_sejour and r.date_fin_sejour or ?3 BETWEEN r.date_debut_sejour and r.date_fin_sejour or ( ?2 < r.date_debut_sejour and ?3 > r.date_fin_sejour) and ?2 BETWEEN p.date_debut and p.date_fin ) and ?2 BETWEEN p.date_debut and p.date_fin) and ?2 BETWEEN p.date_debut and p.date_fin",nativeQuery=true)
	public List<Prix> getAllAvailableOffersByIdHotel(Long id_hotel, String date_d, String date_f);
	
}
