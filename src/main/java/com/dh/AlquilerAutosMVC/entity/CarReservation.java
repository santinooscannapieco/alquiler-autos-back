package com.dh.AlquilerAutosMVC.entity;

import com.dh.AlquilerAutosMVC.dto.CarReservationCreateDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationUpdateDTO;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "carReservations")
public class CarReservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "car_reservation_id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ElementCollection
    @Column(name = "pickup_item")
    private List<String> pickUp = new ArrayList<>();
    @Column(name = "return_start_date")
    private LocalDate rentalStart;
    @Column(name = "return_end_date")
    private LocalDate rentalEnd;
    @Column(name = "total_price")
    private Double totalPrice;

    @Enumerated(EnumType.STRING)
    private PaymentMethod paymentMethod;

    @Embedded
    private CardPaymentInfo cardPaymentInfo;

    public CarReservation() {
    }

    public CarReservation(Long id, Car car, User user, List<String> pickUp, LocalDate rentalStart, LocalDate rentalEnd, Double totalPrice, PaymentMethod paymentMethod, CardPaymentInfo cardPaymentInfo) {
        this.id = id;
        this.car = car;
        this.user = user;
        this.pickUp = pickUp;
        this.rentalStart = rentalStart;
        this.rentalEnd = rentalEnd;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.cardPaymentInfo = cardPaymentInfo;
    }

    public CarReservation(Car car, User user, List<String> pickUp, LocalDate rentalStart, LocalDate rentalEnd, Double totalPrice, PaymentMethod paymentMethod, CardPaymentInfo cardPaymentInfo) {
        this.car = car;
        this.user = user;
        this.pickUp = pickUp;
        this.rentalStart = rentalStart;
        this.rentalEnd = rentalEnd;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.cardPaymentInfo = cardPaymentInfo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<String> getPickUp() {
        return pickUp;
    }

    public void setPickUp(List<String> pickUp) {
        this.pickUp = pickUp;
    }

    public LocalDate getRentalStart() {
        return rentalStart;
    }

    public void setRentalStart(LocalDate rentalStart) {
        this.rentalStart = rentalStart;
    }

    public LocalDate getRentalEnd() {
        return rentalEnd;
    }

    public void setRentalEnd(LocalDate rentalEnd) {
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

    public CarReservationDTO toDTO() {
        CarReservationDTO dto = new CarReservationDTO();
        dto.setId(this.id);
        dto.setCar(this.car.toDTO());
        dto.setUserId(this.user.getId());
        dto.setPickUp(this.pickUp);
        dto.setRentalStart(this.rentalStart.toString());
        dto.setRentalEnd(this.rentalEnd.toString());
        dto.setTotalPrice(this.totalPrice);
        dto.setPaymentMethod(this.paymentMethod);
        dto.setCardPaymentInfo(this.cardPaymentInfo);

        return dto;
    }

    public static CarReservation fromCreateDTO(CarReservationCreateDTO createDTO, Car car, User user, Double totalPrice) {
        CarReservation reservation = new CarReservation();
        reservation.setCar(car);
        reservation.setUser(user);
        reservation.setPickUp(createDTO.getPickUp());
        reservation.setRentalStart(LocalDate.parse(createDTO.getRentalStart()));
        reservation.setRentalEnd(LocalDate.parse(createDTO.getRentalEnd()));
        reservation.setTotalPrice(totalPrice);
        reservation.setPaymentMethod(createDTO.getPaymentMethod());
        reservation.setCardPaymentInfo(createDTO.getCardPaymentInfo());

        return reservation;
    }


    public void applyUpdateDTO(CarReservationUpdateDTO dto, Car car, User user, Double totalPrice) {
        this.setCar(car);
        this.setUser(user);
        this.setPickUp(dto.getPickUp());
        this.setRentalStart(LocalDate.parse(dto.getRentalStart()));
        this.setRentalEnd(LocalDate.parse(dto.getRentalEnd()));
        this.setTotalPrice(totalPrice);
        this.setPaymentMethod(dto.getPaymentMethod());
        this.setCardPaymentInfo(dto.getCardPaymentInfo());
    }

}
