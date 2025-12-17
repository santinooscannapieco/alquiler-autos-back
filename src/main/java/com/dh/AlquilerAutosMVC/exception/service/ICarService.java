package com.dh.AlquilerAutosMVC.exception.service;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ICarService {

    CarDTO save(CarDTO carDTO, MultipartFile[] images);
    Optional<CarDTO> findById(Long id) throws ResourceNotFoundException;
    CarDTO update(CarDTO carDTO, MultipartFile[] images);
    void delete(Long id) throws ResourceNotFoundException;
    List<CarDTO> findAll();
    List<CarDTO> findByCarBrand(String carBrand) throws Exception;
    List<CarDTO> findByName(String name) throws Exception;
    List<CarDTO> findAvailableCars(LocalDate startDate, LocalDate endDate, Long excludeBookingId);
    List<CarDTO> findWithFilters(String name, Long categoryId, LocalDate startDate, LocalDate endDate) throws Exception;
}
