package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.entity.Car;

import java.util.List;
import java.util.Optional;

public interface ICarService {

    Car save(Car car);
    Optional<Car> findById(Long id);
    void update(Car car);
    void delete(Long id);
    List<Car> findAll();
}
