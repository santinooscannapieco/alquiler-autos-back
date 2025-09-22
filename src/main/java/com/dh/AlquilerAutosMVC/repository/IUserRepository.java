package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IUserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
