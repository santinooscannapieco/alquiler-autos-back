package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.CarReservationCreateDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.CarReservationUpdateDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.entity.Role;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.CarUnavailableException;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.ICarReservationService;
import com.dh.AlquilerAutosMVC.repository.ICarRepository;
import com.dh.AlquilerAutosMVC.repository.ICarReservationRepository;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.AccessDeniedException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CarReservationServiceImpl implements ICarReservationService {

    private final ICarReservationRepository carReservationRepository;
    private final ICarRepository carRepository;
    private final IUserRepository userRepository;

    private final CarServiceImpl carService;

    @Autowired
    public CarReservationServiceImpl(ICarReservationRepository carReservationRepository, ICarRepository carRepository, IUserRepository userRepository, CarServiceImpl carService) {
        this.carReservationRepository = carReservationRepository;
        this.carRepository = carRepository;
        this.userRepository = userRepository;
        this.carService = carService;
    }

    public Double calculatePrice(LocalDate start, LocalDate end, Integer pricePerDay) {
        long days = end.toEpochDay() - start.toEpochDay();
        if (days == 0) days = 1;

        return (double) ((days + 1) * pricePerDay);
    }

    @Override
    public CarReservationDTO save(CarReservationCreateDTO createDto) {
        Car car = carRepository.findById(createDto.getCarId())
                .orElseThrow(() -> new RuntimeException("Car not found"));
        User user = userRepository.findById(createDto.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        LocalDate start = LocalDate.parse(createDto.getRentalStart());
        LocalDate end = LocalDate.parse(createDto.getRentalEnd());

        if (end.isBefore(start)) {
            throw new IllegalArgumentException("La fecha de fin no puede ser anterior a la de inicio");
        }

        boolean available = carService.isCarAvailable(car.getId(), start, end, null);
        if (!available) {
            throw new CarUnavailableException("El auto no está disponible en esas fechas");
        }

        Double totalPrice = calculatePrice(start, end, car.getPricePerDay());

        CarReservation reservation = CarReservation.fromDTO(createDto, car, user, totalPrice);

        CarReservation saved = carReservationRepository.save(reservation);

        return saved.toDTO();
    }

    @Override
    public CarReservationDTO update(CarReservationUpdateDTO dto) throws Exception {

        if (carReservationRepository.findById(dto.getId()).isPresent()) {
            Car car = carRepository.findById(dto.getCarId())
                    .orElseThrow(() -> new RuntimeException("Car not found"));
            User user = userRepository.findById(dto.getUserId())
                    .orElseThrow(() -> new RuntimeException("Car not found"));

            LocalDate start = LocalDate.parse(dto.getRentalStart());
            LocalDate end = LocalDate.parse(dto.getRentalEnd());

            if (end.isBefore(start)) {
                throw new IllegalArgumentException("La fecha de fin no puede ser anterior a la de inicio");
            }

            boolean available = carService.isCarAvailable(car.getId(),start, end, dto.getId());
            if (!available) {
                throw new CarUnavailableException("El auto no está disponible en esas fechas");
            }

            Double totalPrice = calculatePrice(start, end, car.getPricePerDay());

            CarReservation reservation = CarReservation.fromDTO(dto, car, user, totalPrice);

            CarReservation saved = carReservationRepository.save(reservation);

            return saved.toDTO();
        } else {
            throw new Exception("Reserva no encontrada");
        }
    }

    @Override
    public void delete(Long id, User currentUser) throws ResourceNotFoundException, AccessDeniedException {
        CarReservation carReservation = carReservationRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Reservation not found"));

        System.out.println("ROLE: " + currentUser.getRole());
        System.out.println("ADMIN");
        if(currentUser.getRole() == Role.ADMIN) {

            carReservationRepository.delete(carReservation);
            return;
        }

        if(currentUser.getRole() == Role.USER
                && carReservation.getUser().getId().equals(currentUser.getId())) {
            carReservationRepository.delete(carReservation);
            return;
        }

        throw new AccessDeniedException("No tiene permisos para eliminar esta reserva");
    }

    @Override
    public Optional<CarReservationDTO> findById(Long id) throws ResourceNotFoundException {
        Optional<CarReservation> carReservationToLookFor = carReservationRepository.findById(id);

        if (carReservationToLookFor.isPresent()) {
            CarReservation carReservation = carReservationToLookFor.get();

            CarReservationDTO carReservationDTOToReturn = carReservation.toDTO();

            return Optional.of(carReservationDTOToReturn);
        } else {
            throw new ResourceNotFoundException("No se encontró la reserva con id: "+ id);
        }
    }

    @Override
    public List<CarReservationDTO> findAll() {
        // Traemos las entidades de la BD
        List<CarReservation> carReservationList = carReservationRepository.findAll();

        // Creamos lista vacia de reservasDTO que vamos a devolver
        List<CarReservationDTO> carReservationDTOList = new ArrayList<>();

        // Recorremos la lista de entidades de reserva
        // Para guardarlas en la nueva lista de reservas DTO
        for (CarReservation carReservation : carReservationList) {
            carReservationDTOList.add(carReservation.toDTO());
        }

        return carReservationDTOList;
    }

    @Override
    public List<CarReservationDTO> findByUserId(Long id, User currentUser) throws AccessDeniedException {
        if (!currentUser.getRole().equals(Role.ADMIN) && !currentUser.getId().equals(id)) {
            throw new AccessDeniedException("No tiene permisos para ver estas reservas");
        }

        List<CarReservation> reservations = carReservationRepository.findByUserId(id);

        return reservations.stream()
                .map(CarReservation::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CarReservationDTO> findByCarId(Long id) {
        List<CarReservation> reservations = carReservationRepository.findByCarId(id);

        return reservations.stream()
                .map(CarReservation::toDTO)
                .collect(Collectors.toList());
    }
}
