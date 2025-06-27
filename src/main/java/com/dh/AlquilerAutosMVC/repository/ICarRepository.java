package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICarRepository extends JpaRepository<Car, Long> {
}
