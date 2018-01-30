package dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import entities.Gerant;

@Repository
public interface GerantRepository extends JpaRepository<Gerant, Long> {

}
