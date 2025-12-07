package com.dh.AlquilerAutosMVC.dto;

import com.dh.AlquilerAutosMVC.entity.CardPaymentInfo;
import com.dh.AlquilerAutosMVC.entity.PaymentMethod;
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
    private PaymentMethod paymentMethod;
    private CardPaymentInfo cardPaymentInfo;
}
