package dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import entities.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
    public User findByUserName(String username);
    
    @Query("select role as role from User where userName=?1")
    public List<String> findRoleByUserName(String username);
    
    
}