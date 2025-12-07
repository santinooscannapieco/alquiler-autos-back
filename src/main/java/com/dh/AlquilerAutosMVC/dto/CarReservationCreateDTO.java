package com.dh.AlquilerAutosMVC.dto;

import com.dh.AlquilerAutosMVC.entity.CardPaymentInfo;
import com.dh.AlquilerAutosMVC.entity.PaymentMethod;
import lombok.Data;

import java.util.List;

public class CarReservationCreateDTO {
    private Long carId;
    private Long userId;
    private List<String> pickUp;
    private String rentalStart;
    private String rentalEnd;
    private Double totalPrice;
    private PaymentMethod paymentMethod;
    private CardPaymentInfo cardPaymentInfo;


    public Long getCarId() {
        return carId;
    }

    public void setCarId(Long carId) {
        this.carId = carId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public List<String> getPickUp() {
        return pickUp;
    }

    public void setPickUp(List<String> pickUp) {
        this.pickUp = pickUp;
    }

    public String getRentalStart() {
        return rentalStart;
    }

    public void setRentalStart(String rentalStart) {
        this.rentalStart = rentalStart;
    }

    public String getRentalEnd() {
        return rentalEnd;
    }

    public void setRentalEnd(String rentalEnd) {
        this.rentalEnd = rentalEnd;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public CardPaymentInfo getCardPaymentInfo() {
        return cardPaymentInfo;
    }

    public void setCardPaymentInfo(CardPaymentInfo cardPaymentInfo) {
        this.cardPaymentInfo = cardPaymentInfo;
    }
}
