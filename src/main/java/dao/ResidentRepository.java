package dao;

import org.springframework.data.jpa.repository.JpaRepository;

import entities.Resident;

public interface ResidentRepository extends JpaRepository<Resident, Long>{

}
