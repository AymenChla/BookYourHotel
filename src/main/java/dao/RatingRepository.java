package dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import entities.Rating;

public interface RatingRepository extends JpaRepository<Rating, Long>{
	@Query(value = "select avg(nb_etoiles) from ratings where id_hotel = :id_hotel group by id_hotel",nativeQuery=true)
	public Float getAvgRatingByHotel(@Param("id_hotel") Long id_hotel);
	
	@Query(value="select * from ratings where id_client = ? and id_hotel = ? limit 1",nativeQuery=true)
	public Rating getRatingUserByHotel(Long id_client, Long id_hotel);
}


