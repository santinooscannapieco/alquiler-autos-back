package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;

import java.util.List;
import java.util.Optional;

public interface ICarService {

    CarDTO save(CarDTO carDTO) throws IllegalAccessException;
    Optional<CarDTO> findById(Long id) throws ResourceNotFoundException;
    CarDTO update(CarDTO carDTO) throws ResourceNotFoundException;
    void delete(Long id) throws ResourceNotFoundException;
    List<CarDTO> findAll();
    List<CarDTO> findByCarBrand(String carBrand) throws Exception;
    List<CarDTO> findByName(String name) throws Exception;

}
