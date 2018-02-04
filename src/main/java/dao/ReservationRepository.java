package dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import entities.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>{

	
	@Query(value="select * from reservations where id_client=?1",nativeQuery=true)
	public List<Reservation> getReservationsByIdCLient(Long id_client);
	
	@Query(value="select * from reservations order by id_reservation desc limit ?1",nativeQuery=true)
	public List<Reservation> getLastReservations(Integer nb);
}

