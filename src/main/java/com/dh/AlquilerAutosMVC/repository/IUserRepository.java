package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserRepository extends JpaRepository<User, Long> {
}
