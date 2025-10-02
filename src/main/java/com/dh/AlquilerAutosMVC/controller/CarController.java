package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.ICarService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/autos")
public class CarController {

    private final ICarService iCarService;

    @Autowired
    public CarController(ICarService iCarService) {
        this.iCarService = iCarService;
    }


    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<CarDTO> save(
            @RequestPart("car") String carJson,
            @RequestPart(value = "images", required = false) MultipartFile[] images
    ) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        CarDTO carDTO = mapper.readValue(carJson, CarDTO.class);

        return ResponseEntity.ok(iCarService.save(carDTO, images));
    }

    @PutMapping
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<CarDTO> update(@RequestBody CarDTO carDTO, @RequestPart(value = "images", required = false) MultipartFile[] images) {
        CarDTO updated = iCarService.update(carDTO, images);
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<String> delete(@PathVariable Long id) throws ResourceNotFoundException {
        iCarService.delete(id);
        return ResponseEntity.ok("Se eliminó el auto con id: " + id);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CarDTO> findById(@PathVariable Long id) throws ResourceNotFoundException {
        Optional<CarDTO> carDTO = iCarService.findById(id);

        if (carDTO.isPresent()) {
            return ResponseEntity.ok(carDTO.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping
    public ResponseEntity<List<CarDTO>> findAll() {
        return ResponseEntity.ok(iCarService.findAll());
    }

    @GetMapping("/marca/{carBrand}")
    public ResponseEntity<List<CarDTO>> findByCarBrand(@PathVariable String carBrand) throws Exception {
        List<CarDTO> carList = iCarService.findByCarBrand(carBrand);

        if (carList != null) {
            return ResponseEntity.ok(carList);
        } else {
            throw new Exception("No se encontró autos con la marca: " + carBrand);
        }

    }

    @GetMapping("/nombre")
    public ResponseEntity<List<CarDTO>> findByName(@RequestParam String name) throws Exception {
        List<CarDTO> carList = iCarService.findByName(name);

        if (carList.isEmpty()) {
            throw new Exception("No se encontró un auto con el nombre: " + name);
        }
        return ResponseEntity.ok(carList);
    }
}
