package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.entity.Category;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.repository.ICarReservationRepository;
import com.dh.AlquilerAutosMVC.repository.ICategoryRepository;
import com.dh.AlquilerAutosMVC.exception.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CarServiceImpl implements ICarService {

    private final ICarRepository carRepository;
    private final ICategoryRepository categoryRepository;
    private final ICarReservationRepository carReservationRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    public CarServiceImpl(ICarRepository carRepository, ICategoryRepository categoryRepository, ICarReservationRepository carReservationRepository) {
        this.carRepository = carRepository;
        this.categoryRepository = categoryRepository;
        this.carReservationRepository = carReservationRepository;
    }

    private List<String> uploadImages(MultipartFile[] images) {
        List<String> urls = new ArrayList<>();
        if (images == null) return urls;

        for (MultipartFile image : images) {
            try {
                Map uploadResult = cloudinary.uploader().upload(image.getBytes(), ObjectUtils.emptyMap());
                urls.add((String) uploadResult.get("secure_url"));
            } catch (IOException e) {
                throw new RuntimeException("Error al subir imagen", e);
            }
        }
        return urls;
    }


    @Override
    public CarDTO save(CarDTO carDTO, MultipartFile[] images) {
        Category category = categoryRepository.findById(carDTO.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Categoría no encontrada"));

        Car car = Car.fromDTO(carDTO, category);
        List<String> imageUrls = uploadImages(images);
        car.setImagePaths(imageUrls);

        carRepository.save(car);
        return car.toDTO();
    }

    @Override
    public Optional<CarDTO> findById(Long id) throws ResourceNotFoundException {
        Car car = carRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Auto no encontrado"));
        return Optional.of(car.toDTO());
    }


    @Override
    public CarDTO update(CarDTO carDTO, MultipartFile[] images) {
        Car car = carRepository.findById(carDTO.getId())
                .orElseThrow(() -> new RuntimeException("Auto no encontrado"));

        car.setName(carDTO.getName());
        car.setDescription(carDTO.getDescription());
        car.setCarBrand(carDTO.getCarBrand());
        car.setPricePerDay(carDTO.getPricePerDay());
        car.setCharacteristics(carDTO.getCharacteristics());
        car.setImagePaths(carDTO.getImagePaths());

        if (carDTO.getCategoryId() != null) {
            Category category = categoryRepository.findById(carDTO.getCategoryId())
                    .orElseThrow(() -> new RuntimeException("Categoría no encontrada"));
            car.setCategory(category);
        }

        if (images != null && images.length > 0) {
            List<String> newImageUrls = uploadImages(images);
            car.getImagePaths().addAll(newImageUrls);
        }

        carRepository.save(car);
        return car.toDTO();
    }


    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        Optional<Car> carToLookFor = carRepository.findById(id);

        if (carToLookFor.isPresent()) {
            carRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("No existe un auto con id: " + id);
        }
    }

    @Override
    public List<CarDTO> findAll() {
        return carRepository.findAll().stream()
                .map(Car::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CarDTO> findByCarBrand(String carBrand) {
        List<Car> cars = carRepository.findByCarBrandContainingIgnoreCase(carBrand);
        return cars.stream()
                .map(Car::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CarDTO> findByName(String name) throws Exception {
        List<Car> cars = carRepository.findByNameContainingIgnoreCase(name);
        return cars.stream()
                .map(Car::toDTO)
                .collect(Collectors.toList());
    }

    public boolean isCarAvailable(Long carId, LocalDate start, LocalDate end, Long excludeReservationId) {
        List<CarReservation> reservations = carReservationRepository.findByCarId(carId);

        for (CarReservation r : reservations) {
            if (excludeReservationId != null && r.getId().equals(excludeReservationId)) continue;

            if (!(end.isBefore(r.getRentalStart()) || start.isAfter(r.getRentalEnd()))) {
                return false;
            }
        }

        return true;
    }

    @Override
    public List<CarDTO> findAvailableCars(LocalDate startDate, LocalDate endDate) {
        List<Car> allCars = carRepository.findAll();

        return allCars.stream()
                .filter(car -> isCarAvailable(car.getId(), startDate, endDate, null))
                .map(Car::toDTO)
                .toList();
    }


    // TODO: AGREGAR
    //  - Buscar por precio por día (Traer lista de autos)

}
