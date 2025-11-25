package com.dh.AlquilerAutosMVC.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CarReservationDTO {
    private Long id;
    private CarDTO car;
    private Long userId;
    private List<String> pickUp;
    private String rentalStart;
    private String rentalEnd;
    private Double totalPrice;
}
