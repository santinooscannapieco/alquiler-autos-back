package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import com.dh.AlquilerAutosMVC.exception.service.ICarReservationService;
import com.dh.AlquilerAutosMVC.exception.service.ICarService;
import com.dh.AlquilerAutosMVC.exception.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/reservas")
public class CarReservationController {

    private final ICarReservationService iCarReservationService;
    private final ICarService iCarService;
    private final IUserService iUserService;
    private final IUserRepository iUserRepository;

    @Autowired
    public CarReservationController(ICarReservationService iCarReservationService, ICarService iCarService, IUserService iUserService, IUserRepository iUserRepository) {
        this.iCarReservationService = iCarReservationService;
        this.iCarService = iCarService;
        this.iUserService = iUserService;
        this.iUserRepository = iUserRepository;
    }

    // TODO: AGREGAR
    //  - por qué no se podría guardar el turno
    //     . ej: si el auto no está disponible en esa fecha
    //       hay que chequear en getCarReservations
    /*
    Optional<Car> car = iCarService.findById(carReservationDTO.getCar_id());
    car.get().getCarReservations()
    // Preguntar si tiene reservas esos días
    */
    // Chequear si está bien que USER pueda ejecutar esta petición sin filtros
    @PostMapping
    @PreAuthorize("#carReservationDTO.userId == authentication.principal.id or hasRole('ADMIN')")
    public ResponseEntity<CarReservationDTO> save(@RequestBody CarReservationDTO carReservationDTO) throws ResourceNotFoundException {
        ResponseEntity<CarReservationDTO> response;

        if (iCarService.findById(carReservationDTO.getCarId()).isPresent()
                && iUserService.findById(carReservationDTO.getUserId()).isPresent()) {
            response = ResponseEntity.ok(iCarReservationService.save(carReservationDTO));
        } else {
            response = ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
        return response;
    }

    // TODO: AGREGAR
    //  filtros de por qué no se podría actualizar
    //  - si cambia fecha (chequear si el auto está disponible)
    // Chequear si está bien que USER pueda ejecutar esta petición sin filtros
    @PutMapping
    @PreAuthorize("#carReservationDTO.userId == authentication.principal.id or hasRole('ADMIN')")
    public ResponseEntity<CarReservationDTO> update(@RequestBody CarReservationDTO carReservationDTO) throws Exception {
        ResponseEntity<CarReservationDTO> response;

        if(iCarService.findById(carReservationDTO.getCarId()).isPresent()
                && iUserService.findById(carReservationDTO.getUserId()).isPresent()) {

            response = ResponseEntity.ok(iCarReservationService.update(carReservationDTO));
        } else {
            response = ResponseEntity.badRequest().build();
        }
        return response;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Long id) throws ResourceNotFoundException, AccessDeniedException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();

        User currentUser = iUserRepository.findByEmail(email)
                        .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        iCarReservationService.delete(id, currentUser);
        return ResponseEntity.ok("Se eliminó la reserva con id: " + id);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<CarReservationDTO> findById(@PathVariable Long id) throws ResourceNotFoundException {
        Optional<CarReservationDTO> carReservationDTOToLookFor = iCarReservationService.findById(id);

        return ResponseEntity.ok(carReservationDTOToLookFor.get());
    }

    // Endpoint consulto todas las reservas
    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<List<CarReservationDTO>> findAll() {
        return ResponseEntity.ok(iCarReservationService.findAll());
    }

    // Crear una petición para consultar todas las reservas
    // hechas por un usuario específico
//    @PreAuthorize("#user_id == authentication.principal.id or hasRole('ADMIN')")
    @GetMapping("/usuarios/{id}")
    public ResponseEntity<List<CarReservationDTO>> findByUserId(@PathVariable("id") Long userId) throws AccessDeniedException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = iUserRepository.findByEmail(authentication.getName()).orElseThrow();

        return ResponseEntity.ok(iCarReservationService.findByUserId(userId, currentUser));
    }

    /*
    @GetMapping("/auto/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<List<CarReservationDTO>> findByCarId(@PathVariable Long car_id) {
        List<CarReservationDTO> carReservationList = iCarReservationService.findAll();
        List<CarReservationDTO> carReservationListToReturn = null;

        for (CarReservationDTO carReservationDTO : carReservationList) {
            if (carReservationDTO.getUser_id() == car_id) {
                carReservationListToReturn.add(carReservationDTO);
            }
        }

        return ResponseEntity.ok(carReservationListToReturn);
    }*/

}
