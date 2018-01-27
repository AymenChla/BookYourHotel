package dao;

import org.springframework.data.jpa.repository.JpaRepository;

import entities.Hotel;

public interface HotelRepository extends JpaRepository<Hotel, Long> {

}
