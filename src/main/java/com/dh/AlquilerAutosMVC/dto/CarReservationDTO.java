package com.dh.AlquilerAutosMVC.dto;

import lombok.Data;

@Data
public class CarReservationDTO {
    private Long id;
    private Long carId;
    private Long userId;
    private String pickUp;
    private String rentalStart;
    private String rentalEnd;
}
