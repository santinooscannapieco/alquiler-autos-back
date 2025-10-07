package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.dto.DateRangeDTO;
import com.dh.AlquilerAutosMVC.entity.Category;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;

import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.repository.ICategoryRepository;
import com.dh.AlquilerAutosMVC.exception.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CarServiceImpl implements ICarService {

    private final ICarRepository carRepository;
    private final ICategoryRepository categoryRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    public CarServiceImpl(ICarRepository carRepository, ICategoryRepository categoryRepository) {
        this.carRepository = carRepository;
        this.categoryRepository = categoryRepository;
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
        Category category = categoryRepository.findById(carDTO.getCategory_id())
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
        car.setPricePerHour(carDTO.getPricePerHour());
        car.setCharacteristics(carDTO.getCharacteristics());
        car.setImagePaths(carDTO.getImagePaths());

        if (carDTO.getCategory_id() != null) {
            Category category = categoryRepository.findById(carDTO.getCategory_id())
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


    // TODO: AGREGAR
    //  - (LISTO)Buscar por CarBrand (Traer lista de autos)
    //  - (LISTO)Buscar por nombre de auto (POSIBLE: Autocompletar lo q va escribiendo)
    //  - Buscar por precio por hora (Traer lista de autos)

}
