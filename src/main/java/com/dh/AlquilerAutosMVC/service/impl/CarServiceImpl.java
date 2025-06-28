package com.dh.AlquilerAutosMVC.service.impl;

import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CarServiceImpl implements ICarService {

    private ICarRepository carRepository;

    @Autowired
    public CarServiceImpl(ICarRepository carRepository) {
        this.carRepository = carRepository;
    }

    @Override
    public Car save(Car car) {
        return carRepository.save(car);
    }

    @Override
    public Optional<Car> findById(Long id) {
        return carRepository.findById(id);
    }

    @Override
    public void update(Car car) {
        carRepository.save(car);
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        Optional<Car> carToLookFor = carRepository.findById(id);

        if (carToLookFor.isPresent()) {
            carRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("No se elimino ya que no se encontró un auto con id: " + id);
        }


    }

    @Override
    public List<Car> findAll() {
        return carRepository.findAll();
    }

    @Override
    public List<Car> findByCarBrand(String carBrand) {
        return carRepository.findByCarBrand(carBrand);
    }

    @Override
    public List<Car> findByName(String name) throws Exception {
        return carRepository.findByName(name);
    }


    // TODO: AGREGAR
    //  - (LISTO)Buscar por CarBrand (Traer lista de autos)
    //  - Buscar por nombre de auto (POSIBLE: Autocompletar lo q va escribiendo)
    //  - Buscar por precio por hora (Traer lista de autos)


    /*public Car findByCarBrand(String carBrand) {
        return carIDao.findByString(carBrand);
    }

    @Override
    public List<Car> findByCarBrand(String carBrand) {
        return //carRepository.findByCarBrand(carBrand);
    }*/


}
