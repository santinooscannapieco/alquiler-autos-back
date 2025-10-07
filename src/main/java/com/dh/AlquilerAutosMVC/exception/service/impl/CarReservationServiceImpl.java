package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.entity.Role;
import com.dh.AlquilerAutosMVC.entity.User;
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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CarReservationServiceImpl implements ICarReservationService {

    private final ICarReservationRepository carReservationRepository;
    private final ICarRepository carRepository;
    private final IUserRepository userRepository;

    @Autowired
    public CarReservationServiceImpl(ICarReservationRepository carReservationRepository, ICarRepository carRepository, IUserRepository userRepository) {
        this.carReservationRepository = carReservationRepository;
        this.carRepository = carRepository;
        this.userRepository = userRepository;
    }

    @Override
    public CarReservationDTO save(CarReservationDTO dto) {
        Car car = carRepository.findById(dto.getCarId())
                .orElseThrow(() -> new RuntimeException("Car not found"));
        User user = userRepository.findById(dto.getUserId())
                .orElseThrow(() -> new RuntimeException("Car not found"));

        CarReservation reservation = CarReservation.fromDTO(dto, car, user);

        CarReservation saved = carReservationRepository.save(reservation);

        return saved.toDTO();
    }

    @Override
    public CarReservationDTO update(CarReservationDTO dto) throws Exception {

        if (carReservationRepository.findById(dto.getId()).isPresent()) {
            Car car = carRepository.findById(dto.getCarId())
                    .orElseThrow(() -> new RuntimeException("Car not found"));
            User user = userRepository.findById(dto.getUserId())
                    .orElseThrow(() -> new RuntimeException("Car not found"));

            CarReservation reservation = CarReservation.fromDTO(dto, car, user);

            CarReservation saved = carReservationRepository.save(reservation);

            return saved.toDTO();
        } else {
            throw new Exception("No se pudo actualizar el turno");
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


    // - Buscar por ID de usuario
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

    // TODO: AGREGAR
    //  - Buscar por id de auto (Para ver lista de reservar que tiene)
    //  - Buscar por id de usuario
    //  ...
    //  Necesito entender como hacer la petición de lista de autos que
    //  ya tienen reservado tal y tal día
}
