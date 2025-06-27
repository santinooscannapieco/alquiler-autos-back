package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.entity.CarReservation;

import java.util.List;
import java.util.Optional;

public interface ICarReservationService {


    CarReservation save(CarReservation carReservation);
    Optional<CarReservation> findById(Long id);
    void update(CarReservation carReservation);
    void delete(Long id);
    List<CarReservation> findAll();
}
