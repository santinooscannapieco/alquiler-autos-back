package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/autos")
public class CarController {

    private ICarService iCarService;

    @Autowired
    public CarController(ICarService iCarService) {
        this.iCarService = iCarService;
    }

    // endpoint para agregar un auto
    @PostMapping
    public ResponseEntity<Car> save(@RequestBody Car car) {
        return ResponseEntity.ok(iCarService.save(car));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Car> findById(@PathVariable Long id) {
        Optional<Car> car = iCarService.findById(id);

        if (car.isPresent()) {
            return ResponseEntity.ok(car.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // endpoint que nos permita actualizar un auto ya existente
    @PutMapping
    public ResponseEntity<String> update(@RequestBody Car car) {
        ResponseEntity<String> response;
        Optional<Car> carToLookFor = iCarService.findById(car.getId());

        if (carToLookFor.isPresent()) {
            iCarService.update(car);
            response = ResponseEntity.ok("Se actualizó el auto con id: " + car.getId());
        } else {
            response = ResponseEntity.ok().body("No se puede actualizar un auto que no existe dentro de la BD");
        }

        return response;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        ResponseEntity<String> response;

        if (iCarService.findById(id).isPresent()) {
            iCarService.delete(id);
            response = ResponseEntity.ok("Se eliminó el auto con id: " + id);
        } else {
            response = ResponseEntity.ok().body("No se puede eliminar un auto que no existe dentro de la BD");
        }
        return response;
    }

    @GetMapping
    public ResponseEntity<List<Car>> findAll() {
        return ResponseEntity.ok(iCarService.findAll());
    }

    /*
    @GetMapping("/marca/{carBrand}")
    public List<Car> findByCarBrand(@PathVariable String carBrand) {
        return carServiceImpl.findByCarBrand(carBrand);
    }*/

}
