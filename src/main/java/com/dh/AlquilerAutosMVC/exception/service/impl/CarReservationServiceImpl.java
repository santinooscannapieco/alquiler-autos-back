package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.entity.Car;
import com.dh.AlquilerAutosMVC.entity.Role;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.ICarReservationService;
import com.dh.AlquilerAutosMVC.repository.ICarReservationRepository;
import com.dh.AlquilerAutosMVC.entity.CarReservation;
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

    @Autowired
    public CarReservationServiceImpl(ICarReservationRepository carReservationRepository) {
        this.carReservationRepository = carReservationRepository;
    }

    @Override
    public CarReservationDTO save(CarReservationDTO carReservationDTO) {
        // Mapear nuestras entidades como DTO
        // Instanciar una entidad de reserva
        CarReservation carReservationEntity = new CarReservation();

        // Instanciar un auto
        Car carEntity = new Car();
        carEntity.setId(carReservationDTO.getCar_id());

        // Instanciar un usuario
        User userEntity = new User();
        userEntity.setId(carReservationDTO.getUser_id());

        carReservationEntity.setCar(carEntity);
        carReservationEntity.setUser(userEntity);
        carReservationEntity.setPickUp(carReservationDTO.getPickUp());

        //convertir un String en LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate rentalStart = LocalDate.parse(carReservationDTO.getRentalStart(), formatter);
        LocalDate rentalEnd = LocalDate.parse(carReservationDTO.getRentalEnd(), formatter);

        carReservationEntity.setRentalStart(rentalStart);
        carReservationEntity.setRentalEnd(rentalEnd);

        // Persisto en la BD
        carReservationRepository.save(carReservationEntity);


        // Vamos a trabajar con el DTO que vamos a devolver
        CarReservationDTO carReservationDTOToReturn = new CarReservationDTO();

        //Seteo los datos de la entidad
        carReservationDTOToReturn.setId(carReservationEntity.getId());
        carReservationDTOToReturn.setCar_id(carReservationEntity.getCar().getId());
        carReservationDTOToReturn.setUser_id(carReservationEntity.getUser().getId());
        carReservationDTOToReturn.setPickUp(carReservationEntity.getPickUp());
        carReservationDTOToReturn.setRentalStart(carReservationEntity.getRentalStart().toString());
        carReservationDTOToReturn.setRentalEnd(carReservationEntity.getRentalEnd().toString());

        return carReservationDTOToReturn;
    }

    @Override
    public Optional<CarReservationDTO> findById(Long id) throws ResourceNotFoundException {
        Optional<CarReservation> carReservationToLookFor = carReservationRepository.findById(id);
        // Instancio un dto
        Optional<CarReservationDTO> carReservationDTO = null;

        if (carReservationToLookFor.isPresent()) {
            CarReservation carReservation = carReservationToLookFor.get();

            //Trabajamos con la info que tenemos q devolver: DTO
            CarReservationDTO carReservationDTOToReturn = new CarReservationDTO();
            carReservationDTOToReturn.setId(carReservation.getId());
            carReservationDTOToReturn.setCar_id(carReservation.getCar().getId());
            carReservationDTOToReturn.setUser_id(carReservation.getUser().getId());
            carReservationDTOToReturn.setPickUp(carReservation.getPickUp());
            carReservationDTOToReturn.setRentalStart(carReservation.getRentalStart().toString());
            carReservationDTOToReturn.setRentalEnd(carReservation.getRentalEnd().toString());

            carReservationDTO = Optional.of(carReservationDTOToReturn);
            return carReservationDTO;
        } else {
            throw new ResourceNotFoundException("No se encontró la reserva con id: "+ id);
        }


    }

    @Override
    public CarReservationDTO update(CarReservationDTO carReservationDTO) throws Exception {

        if (carReservationRepository.findById(carReservationDTO.getId()).isPresent()) {
            Optional<CarReservation> carReservationEntity = carReservationRepository.findById(carReservationDTO.getId());

            Car carEntity = new Car();
            carEntity.setId(carReservationDTO.getCar_id());

            User userEntity = new User();
            userEntity.setId(carReservationDTO.getUser_id());

            carReservationEntity.get().setCar(carEntity);
            carReservationEntity.get().setUser(userEntity);
            carReservationEntity.get().setPickUp(carReservationDTO.getPickUp());

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate rentalStart = LocalDate.parse(carReservationDTO.getRentalStart(), formatter);
            LocalDate rentalEnd = LocalDate.parse(carReservationDTO.getRentalEnd(), formatter);

            carReservationEntity.get().setRentalStart(rentalStart);
            carReservationEntity.get().setRentalEnd(rentalEnd);

            carReservationRepository.save(carReservationEntity.get());

            // Vamos a trabajar con el DTO que vamos a devolver
            CarReservationDTO carReservationDTOToReturn = new CarReservationDTO();

            //Seteo los datos de la entidad
            carReservationDTOToReturn.setId(carReservationEntity.get().getId());
            carReservationDTOToReturn.setCar_id(carReservationEntity.get().getCar().getId());
            carReservationDTOToReturn.setUser_id(carReservationEntity.get().getUser().getId());
            carReservationDTOToReturn.setPickUp(carReservationEntity.get().getPickUp());
            carReservationDTOToReturn.setRentalStart(carReservationEntity.get().getRentalStart().toString());
            carReservationDTOToReturn.setRentalEnd(carReservationEntity.get().getRentalEnd().toString());

            return carReservationDTOToReturn;
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
    public List<CarReservationDTO> findAll() {
        // Traemos las entidades de la BD
        List<CarReservation> carReservationList = carReservationRepository.findAll();

        // Creamos lista vacia de reservasDTO que vamos a devolver
        List<CarReservationDTO> carReservationDTOS = new ArrayList<>();

        // Recorremos la lista de entidades de reserva
        // Para guardarlas en la nueva lista de reservas DTO
        for (CarReservation carReservation : carReservationList) {
            carReservationDTOS.add(new CarReservationDTO(carReservation.getId(),
                    carReservation.getCar().getId(), carReservation.getUser().getId(),
                    carReservation.getPickUp(), carReservation.getRentalStart().toString(),
                    carReservation.getRentalEnd().toString()));
        }

        return carReservationDTOS;
    }


    // - Buscar por ID de usuario

    @Override
    public List<CarReservationDTO> findByUserId(Long id, User currentUser) throws AccessDeniedException {
        if (!currentUser.getRole().equals(Role.ADMIN) && !currentUser.getId().equals(id)) {
            throw new AccessDeniedException("No tiene permisos para ver estas reservas");
        }

        List<CarReservation> reservations = carReservationRepository.findByUserId(id);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        return reservations.stream()
                .map(res -> new CarReservationDTO(
                        res.getId(),
                        res.getCar().getId(),
                        res.getUser().getId(),
                        res.getPickUp(),
                        res.getRentalStart().format(formatter),
                        res.getRentalEnd().format(formatter)
                ))
                .collect(Collectors.toList());

    }

    // TODO: AGREGAR
    //  - Buscar por id de auto (Para ver lista de reservar que tiene)
    //  - Buscar por id de usuario
    //  ...
    //  Necesito entender como hacer la petición de lista de autos que
    //  ya tienen reservado tal y tal día
}
