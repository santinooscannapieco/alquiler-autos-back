package com.dh.AlquilerAutosMVC.exception.service;

import com.dh.AlquilerAutosMVC.dto.CarReservationCreateDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationUpdateDTO;
import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;

public interface ICarReservationService {


    CarReservationDTO save(CarReservationCreateDTO createDTO);
    CarReservationDTO update(CarReservationUpdateDTO updateDTO) throws Exception;
    void delete(Long id, User currentUser) throws ResourceNotFoundException, AccessDeniedException;
    Optional<CarReservationDTO> findById(Long id) throws ResourceNotFoundException;
    List<CarReservationDTO> findAll();
    List<CarReservationDTO> findByUserId(Long id, User currentUser)  throws AccessDeniedException;
    List<CarReservationDTO> findByCarId(Long id);
}
