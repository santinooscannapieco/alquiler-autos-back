package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.entity.CarReservation;

import java.util.List;
import java.util.Optional;

public interface ICarReservationService {


    CarReservationDTO save(CarReservationDTO carReservationDTO);
    Optional<CarReservationDTO> findById(Long id);
    CarReservationDTO update(CarReservationDTO carReservationDTO) throws Exception;
    void delete(Long id);
    List<CarReservationDTO> findAll();
}
