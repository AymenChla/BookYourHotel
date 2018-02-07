package dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import entities.Prix;

@Repository
public interface PrixRepository extends JpaRepository<Prix, Long>{
	
	
	//les offres (prix->chambre->hotel) disponible pour la réservation
	@Query(value="select * from prix p  JOIN chambres c on(p.id_chambre=c.id_chambre)  JOIN hotels h on(c.id_hotel=h.id_hotel) "
				+ "WHERE h.id_hotel in( "
						+ "select c.id_hotel from chambres c JOIN hotels h on(c.id_hotel=h.id_hotel) "
						+ "where h.adresse_hotel like %:dest% "
						+ "and c.id_chambre not in ( "
							+ "select r.id_chambre from reservations r "
							+ "where :date_d BETWEEN r.date_debut_sejour and r.date_fin_sejour "
							+ "or  :date_f BETWEEN r.date_debut_sejour and r.date_fin_sejour "
							+ "or (  :date_d <= r.date_debut_sejour and  :date_f >= r.date_fin_sejour)"
						+ ")"
						+ "group by h.id_hotel "
						+ "HAVING COUNT(h.id_hotel)>=:nbChambre "
				+ ") "
				+ "and c.id_chambre not in ( "
					+ "select r.id_chambre from reservations r "
					+ "where :date_d BETWEEN r.date_debut_sejour and r.date_fin_sejour "
					+ "or  :date_f BETWEEN r.date_debut_sejour and r.date_fin_sejour "
					+ "or (  :date_d <= r.date_debut_sejour and  :date_f >= r.date_fin_sejour) "
				+ ") "
				+ "and :date_d BETWEEN p.date_debut and p.date_fin",nativeQuery=true)
	public List<Prix> getAllAvailableOffers(@Param("dest") String dest,@Param("date_d") String date_d,@Param("date_f") String date_f,@Param("nbChambre") int nbChambre);
	
	//les offres (prix->chambre->hotel) disponible pour la réservation selon id_hotel
	@Query(value="select * from prix p JOIN chambres c on(p.id_chambre=c.id_chambre)  JOIN hotels h on(c.id_hotel=h.id_hotel) "
			+ "WHERE h.id_hotel = :id_hotel "
			+ "and c.id_chambre not in ( "
				+ "select r.id_chambre from reservations r "
				+ "where :date_d BETWEEN r.date_debut_sejour and r.date_fin_sejour "
				+ "or  :date_f BETWEEN r.date_debut_sejour and r.date_fin_sejour "
				+ "or (  :date_d <= r.date_debut_sejour and  :date_f >= r.date_fin_sejour) "
			+ ") "
			+ "and :date_d BETWEEN p.date_debut and p.date_fin",nativeQuery=true)
	public List<Prix> getAllAvailableOffersByIdHotel(@Param("id_hotel") Long id_hotel,@Param("date_d") String date_d,@Param("date_f") String date_f);
	
	@Query(value="select prix from prix  p where id_chambre = ?1 "
				+ "and ?2 BETWEEN p.date_debut and p.date_fin",nativeQuery=true)
	public Double getPrixByIdChambre(Long id_chambre,String date_d);
	
	@Query(value="SELECT * FROM prix p JOIN chambres c on(p.id_chambre=c.id_chambre) where c.id_hotel = :hotel", nativeQuery=true)
	public List<Prix> getAllPrix(@Param("hotel") Long hotel);
	
	@Query(value="SELECT c.type,p.date_debut,p.date_fin,p.prix,p.id_prix FROM prix p JOIN chambres c on(p.id_chambre=c.id_chambre) where c.id_hotel = :hotel GROUP by p.id_prix,c.type,p.date_debut,p.date_fin,p.prix",nativeQuery=true)
	public List<Prix> getPrixByTypeByPeriode(@Param("hotel") Long hotel);
}
