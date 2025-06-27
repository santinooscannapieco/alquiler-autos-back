package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ICarRepository extends JpaRepository<Car, Long> {

//    @Query("SELECT c FROM Car c WHERE c.carBrand=?1")
    List<Car> findByCarBrand(String carBrand);

    @Query("SELECT c FROM Car c WHERE LOWER(c.name) LIKE LOWER(CONCAT('%', :name, '%'))")
    List<Car> findByName(String name);


    // TODO: AGREGAR
    //  findByReservations
}
