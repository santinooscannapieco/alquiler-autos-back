package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICarReservationRepository extends JpaRepository<CarReservation, Long> {
    List<CarReservation> findByUserId(Long userId);
}
