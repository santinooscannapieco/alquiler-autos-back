package com.dh.AlquilerAutosMVC.exception;

public class CarUnavailableException extends RuntimeException {
    public CarUnavailableException(String message) {
        super(message);
    }
}
