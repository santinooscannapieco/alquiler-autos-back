package com.dh.AlquilerAutosMVC.exception.service;

import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import org.springframework.security.core.Authentication;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;

public interface IUserService {

    Optional<UserDTO> findById(Long id)  throws ResourceNotFoundException;
    void update(UserDTO userDTO, Authentication auth) throws ResourceNotFoundException, AccessDeniedException;
    void delete(Long id) throws ResourceNotFoundException;
    List<UserDTO> findAll();
    Optional<UserDTO> findByEmail(String email);
}
