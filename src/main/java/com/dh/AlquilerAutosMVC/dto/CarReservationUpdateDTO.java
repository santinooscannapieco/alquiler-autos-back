package com.dh.AlquilerAutosMVC.dto;

public class CarReservationUpdateDTO extends CarReservationCreateDTO {
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
