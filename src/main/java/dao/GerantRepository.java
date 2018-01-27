package dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import entities.Gerant;

public interface GerantRepository extends JpaRepository<Gerant, Long> {

}
