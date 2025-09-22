package com.dh.AlquilerAutosMVC.service.impl;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.ICarReservationRepository;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import com.dh.AlquilerAutosMVC.service.ICarReservationService;
import com.dh.AlquilerAutosMVC.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements IUserService {

    private IUserRepository userRepository;

    @Autowired
    public UserServiceImpl(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public Optional<UserDTO> findById(Long id) throws ResourceNotFoundException {
        return userRepository.findById(id)
                .map(User::toDTO);
    }

    @Override
    public void update(User user) {
        userRepository.save(user);
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        Optional<User> userToLookFor = userRepository.findById(id);

        if (userToLookFor.isPresent()) {
            userRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("No se pudo eliminar el usuario con id: " + id);
        }

        userRepository.deleteById(id);
    }

    @Override
    public List<UserDTO> findAll() {
        return userRepository.findAll().stream()
                .map(User::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<UserDTO> findByEmail(String email) {
        return userRepository.findByEmail(email)
                .map(User::toDTO);
    }

    // TODO: AGREGAR
    //  - Cambiar de role(solo lo puede hacer el ADMIN)
    //  - Buscar por nombre o apellido

}
