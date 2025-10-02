package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.Role;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import com.dh.AlquilerAutosMVC.exception.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements IUserService {

    private final IUserRepository userRepository;

    @Autowired
    public UserServiceImpl(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Optional<UserDTO> findById(Long id) throws ResourceNotFoundException {
        return userRepository.findById(id)
                .map(User::toDTO);
    }

    @Override
    public void update(UserDTO userDTO, Authentication auth) throws ResourceNotFoundException, AccessDeniedException {
        User user = userRepository.findById(userDTO.id())
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado"));

        User loggedUser = userRepository.findByEmail(auth.getName())
                .orElseThrow(() -> new ResourceNotFoundException("Usuario logueado no encontrado"));

        if (!loggedUser.getId().equals(user.getId()) && loggedUser.getRole() != Role.ADMIN) {
            throw new AccessDeniedException("No tenés permiso para actualizar este usuario");
        }
        user.setFirstname(userDTO.firstname());
        user.setLastName(userDTO.lastName());
        user.setEmail(userDTO.email());

        if (loggedUser.getRole() == Role.ADMIN && userDTO.role() != null) {
            user.setRole(userDTO.role());
        } else if (userDTO.role() != null) {
            throw  new AccessDeniedException("No tenés permiso para cambiar el rol");
        }

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
