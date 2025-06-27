package com.dh.AlquilerAutosMVC.service.impl;

import com.dh.AlquilerAutosMVC.repository.ICarReservationRepository;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.service.ICarReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CarReservationService implements ICarReservationService {

    private ICarReservationRepository carReservationRepository;

    @Autowired
    public CarReservationService(ICarReservationRepository carReservationRepository) {
        this.carReservationRepository = carReservationRepository;
    }

    @Override
    public CarReservation save(CarReservation carReservation) {
        return carReservationRepository.save(carReservation);
    }

    @Override
    public Optional<CarReservation> findById(Long id) {
        return carReservationRepository.findById(id);
    }

    @Override
    public void update(CarReservation carReservation) {
        carReservationRepository.save(carReservation);
    }

    @Override
    public void delete(Long id) {
        carReservationRepository.deleteById(id);
    }

    @Override
    public List<CarReservation> findAll() {
        return carReservationRepository.findAll();
    }

    // TODO: AGREGAR
    //  - Buscar por id de auto (Para ver lista de reservar que tiene)
    //  - Buscar por id de usuario
    //  ...
    //  Necesito entender como hacer la petición de lista de autos que
    //  ya tienen reservado tal y tal día
}
