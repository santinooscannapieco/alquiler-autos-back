package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;

import java.util.List;
import java.util.Optional;

public interface ICarService {

    Car save(Car car);
    Optional<Car> findById(Long id);
    void update(Car car);
    void delete(Long id) throws ResourceNotFoundException;
    List<Car> findAll();
    List<Car> findByCarBrand(String carBrand) throws Exception;
    List<Car> findByName(String name) throws Exception;
}
