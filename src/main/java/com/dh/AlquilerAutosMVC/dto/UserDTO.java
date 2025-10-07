package com.dh.AlquilerAutosMVC.dto;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.Role;
import lombok.Data;

import java.util.List;

@Data
public class UserDTO{
    private Long id;
    private String firstname;
    private String lastName;
    private String email;
    private Role role;
    private List<CarReservationDTO> carReservations;
}
