package com.dh.AlquilerAutosMVC.exception.service;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;

public interface ICarReservationService {


    CarReservationDTO save(CarReservationDTO carReservationDTO);
    CarReservationDTO update(CarReservationDTO carReservationDTO) throws Exception;
    void delete(Long id, User currentUser) throws ResourceNotFoundException, AccessDeniedException;
    Optional<CarReservationDTO> findById(Long id) throws ResourceNotFoundException;
    List<CarReservationDTO> findAll();
    List<CarReservationDTO> findByUserId(Long id, User currentUser)  throws AccessDeniedException;
}
