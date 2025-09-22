package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.service.impl.CarServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CarServiceImplTest {

    @Autowired
    private CarServiceImpl carServiceImpl;

    /*
    @Test
    void findById() {
        Long idCar = Long.valueOf(1);

        // Buscar auto
        Car car = carServiceImpl.findById(idCar);
        assertNotNull(car);
    }*/
}