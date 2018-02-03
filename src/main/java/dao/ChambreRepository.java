package dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import entities.Chambre;;

public interface ChambreRepository extends JpaRepository<Chambre, Long>{
	
	@Query(value="select * from chambres where id_hotel=?1 ", nativeQuery=true)
	public List<Chambre> findByIdHotel(Long idHotel);
	
	@Query(value="select * from chambres where id_hotel=?1 AND type=?2 ", nativeQuery=true)
	public List<Chambre> findByType(Long idHotel, Integer type);
	
	//@Query("from Hotel where adresse like '%?%' and idHotel in(Select idHotel from Chambre where )")
	@Query("from Chambre where hotel.idHotel=1 ")
	public List<Chambre> rechercherCHambre();
	
	
	@Query(value="select * from chambres c natural join reservations r where ?1 not BETWEEN r.date_debut_sejour and r.date_fin_sejour and ?2 not BETWEEN r.date_debut_sejour and r.date_fin_sejour", nativeQuery=true)
	public List<Chambre> getAvailableChambres(String date_debut_sejour,String date_fin_sejour);
	
	
	//@Query(value = "SELECT * FROM chambres c natural join hotels h WHERE c.id_hotel = ?1 and id_hotel in (select id_hotel from chambres c natural join reservations r where ?2 not BETWEEN r.date_debut_sejour and r.date_fin_sejour and ?3 not BETWEEN r.date_debut_sejour and r.date_fin_sejour) LIMIT 1", nativeQuery = true)
	//public Chambre getFirstAvailableChambre(Long id_hotel,String date_debut_sejour,String date_fin_sejour);

	
	//on utilise le prix pour ne pas compter les chambres qui non pas de prix
	@Query(value="select count(id_hotel) from chambres NATURAL JOIN prix p "
				+ "where id_hotel=?2 "
				+ "and description=?1 "
				+ "and id_chambre not in( "
					+ "select r.id_chambre from reservations r "
					+ "where ?3 BETWEEN r.date_debut_sejour and r.date_fin_sejour "
					+ "or ?4 BETWEEN r.date_debut_sejour and r.date_fin_sejour "
					+ "or ( ?3 < r.date_debut_sejour and ?4 > r.date_fin_sejour) "
				+ ") "
				+ "and ?3 between p.date_debut and p.date_fin" ,nativeQuery=true)
	public int getNbChambreDispoByType(String description, Long id_hotel,String date_d, String date_f);
	
	
	@Query(value="select * from chambres NATURAL JOIN prix p "
			+ "where id_hotel=:id_hotel "
			+ "and description=:categ "
			+ "and id_chambre not in( "
				+ "select r.id_chambre from reservations r "
				+ "where :date_d BETWEEN r.date_debut_sejour and r.date_fin_sejour "
				+ "or :date_f BETWEEN r.date_debut_sejour and r.date_fin_sejour "
				+ "or ( :date_d < r.date_debut_sejour and :date_f > r.date_fin_sejour) "
			+ ") "
			+ "and :date_d between p.date_debut and p.date_fin "
			+ "limit 1" ,nativeQuery=true)
	public Chambre getOneChambreDispoByType(@Param("categ") String categorie,@Param("id_hotel") Long id_hotel,@Param("date_d") String date_d, @Param("date_f") String date_f);
}
