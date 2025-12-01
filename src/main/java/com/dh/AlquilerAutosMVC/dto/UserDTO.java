package com.dh.AlquilerAutosMVC.dto;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.Role;
import lombok.Data;

import java.util.List;
import java.util.Set;

@Data
public class UserDTO{
    private Long id;
    private String firstname;
    private String lastName;
    private String email;
    private Role role;
    private Set<Long> favoriteCarIds;
    private List<CarReservationDTO> carReservations;
}
