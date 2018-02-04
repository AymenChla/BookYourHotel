package dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import entities.Commentaire;

@Repository
public interface CommentaireRepository extends JpaRepository<Commentaire, Long>{
	
	@Query(value="select * from commentaires where id_hotel=?1",nativeQuery = true)
	public List<Commentaire> getAllByHotel(Long id_hotel); 
}
