package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.service.ICarReservationService;
import com.dh.AlquilerAutosMVC.service.ICarService;
import com.dh.AlquilerAutosMVC.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/reservas")
public class CarReservationController {

    private ICarReservationService iCarReservationService;
    private ICarService iCarService;
    private IUserService iUserService;

    @Autowired
    public CarReservationController(ICarReservationService iCarReservationService, ICarService iCarService, IUserService iUserService) {
        this.iCarReservationService = iCarReservationService;
        this.iCarService = iCarService;
        this.iUserService = iUserService;
    }

    @PostMapping
    public ResponseEntity<CarReservation> save(@RequestBody CarReservation carReservation) {
        ResponseEntity<CarReservation> response;

        // Chequeamos que existan el auto y el usuario
        if (iCarService.findById(carReservation.getCar().getId()).isPresent()
                && iUserService.findById(carReservation.getUser().getId()).isPresent()) {

            // Seteamos al ResponseEntity con el 200 OK
            response = ResponseEntity.ok(iCarReservationService.save(carReservation));
        } else {

            //Seteamos al ResponseEntity el 400 bad request
            response = ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        return response;
    }


    @GetMapping("/{id}")
    public ResponseEntity<CarReservation> findById(@PathVariable Long id) {
        Optional<CarReservation> carReservationToLookFor = iCarReservationService.findById(id);

        if (carReservationToLookFor.isPresent()) {
            return ResponseEntity.ok(carReservationToLookFor.get());
        } else {
            return  ResponseEntity.notFound().build();
        }
    }

    // TODO: AGREGAR
    //  filtros de porque no se podría actualizar
    //  - si cambia fecha (chequear si el auto está disponible)

    @PutMapping
    public ResponseEntity<String> update(@RequestBody CarReservation carReservation) {
        ResponseEntity<String> response;

        if(iCarService.findById(carReservation.getCar().getId()).isPresent()
                && iUserService.findById(carReservation.getUser().getId()).isPresent()) {
            iCarReservationService.update(carReservation);
            response = ResponseEntity.ok("Se actualizó la reserva con id: " + carReservation.getId());
        } else {
            response = ResponseEntity.badRequest().body("No se pudo actualizar la reserva");
        }
        return response;
    }

    // TODO: AGREGAR
    //  filtros de porque no se podría eliminar

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) {
        ResponseEntity<String> response;

        if (iCarReservationService.findById(id).isPresent()) {
            iCarReservationService.delete(id);
            response = ResponseEntity.ok("Se eliminó la reserva con id: " + id);
        } else {
            response = ResponseEntity.ok().body("No se pudo eliminar la reserva");
        }
        return response;
    }

    // Endpoint consulto todas las reservas
    @GetMapping
    public ResponseEntity<List<CarReservation>> findAll() {
        return ResponseEntity.ok(iCarReservationService.findAll());
    }

}
