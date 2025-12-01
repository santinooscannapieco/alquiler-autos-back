package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.IFavoriteService;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class FavoriteServiceImpl implements IFavoriteService {

    private final IUserRepository userRepository;
    private final ICarRepository carRepository;

    @Autowired
    public FavoriteServiceImpl(IUserRepository userRepository, ICarRepository carRepository) {
        this.userRepository = userRepository;
        this.carRepository = carRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<CarDTO> getFavorites(User user) throws ResourceNotFoundException {

        if (user.getFavoriteCarIds().isEmpty()) {
            return List.of();
        }

        List<Car> cars = carRepository.findAllById(user.getFavoriteCarIds());
        return cars.stream()
                .map(Car::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public CarDTO addFavorite(User user, Long carId) throws ResourceNotFoundException {

        Optional<Car> car = carRepository.findById((carId));

        if (!carRepository.existsById(carId)) {
            throw new ResourceNotFoundException("Car not found");
        }

        user.getFavoriteCarIds().add(carId);

        userRepository.save(user);

        return car.get().toDTO();
    }

    @Override
    public void removeFavorite(User user, Long carId) throws ResourceNotFoundException {
        user.getFavoriteCarIds().remove(carId);

        userRepository.save(user);
    }
}
