package com.dh.AlquilerAutosMVC.dto;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.Role;

import java.util.List;

public record UserDTO(
        Long id,
        String firstname,
        String lastName,
        String email,
        Role role,
        List<CarReservationDTO> carReservations
) {
}
