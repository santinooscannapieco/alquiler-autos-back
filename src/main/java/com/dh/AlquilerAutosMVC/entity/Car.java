package com.dh.AlquilerAutosMVC.entity;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.dto.CategoryDTO;
import com.dh.AlquilerAutosMVC.dto.DateRangeDTO;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Entity
@Table(name = "cars")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @ElementCollection
    private List<String> imagePaths = new ArrayList<>();
    @Column(name = "card_brand")
    private String carBrand;
    @Column(name = "price_per_day")
    private Integer pricePerDay;

    @Column(name = "characteristics")
    private List<String> characteristics;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "car")
    private List<CarReservation> carReservations = new ArrayList<>();


    public Car() {
    }

    public Car(Long id, String name, String description, List<String> imagePaths, String carBrand, Integer pricePerDay, List<String> characteristics, Category category, List<CarReservation> carReservations) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imagePaths = imagePaths;
        this.carBrand = carBrand;
        this.pricePerDay = pricePerDay;
        this.characteristics = characteristics;
        this.category = category;
        this.carReservations = carReservations;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getImagePaths() {
        return imagePaths;
    }

    public void setImagePaths(List<String> imagePaths) {
        this.imagePaths = imagePaths;
    }

    public String getCarBrand() {
        return carBrand;
    }

    public void setCarBrand(String carBrand) {
        this.carBrand = carBrand;
    }

    public Integer getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(Integer pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public List<String> getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(List<String> characteristics) {
        this.characteristics = characteristics;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<CarReservation> getCarReservations() {
        return carReservations;
    }

    public void setCarReservations(List<CarReservation> carReservations) {
        this.carReservations = carReservations;
    }

    public static Car fromDTO(CarDTO dto, Category category) {
        Car car = new Car();

        car.setName(dto.getName());
        car.setDescription(dto.getDescription());
        car.setImagePaths(dto.getImagePaths());
        car.setCarBrand(dto.getCarBrand());
        car.setPricePerDay(dto.getPricePerDay());
        car.setCharacteristics(dto.getCharacteristics());

        if (dto.getCategoryId() == null) {
            throw new IllegalArgumentException("El ID de categoría no puede ser null");
        }

        car.setCategory(category);

        return car;
    }

    public CarDTO toDTO() {
        CarDTO dto = new CarDTO();
        dto.setId(this.id);
        dto.setName(this.name);
        dto.setDescription(this.description);
        dto.setImagePaths(this.imagePaths);
        dto.setCarBrand(this.carBrand);
        dto.setPricePerDay(this.pricePerDay);
        dto.setCharacteristics(this.characteristics);
        dto.setCategoryId(this.getCategory() != null ? this.getCategory().getId() : null);

        // Agregamos los rangos de fechas ocupadas
        List<DateRangeDTO> reservedDates = this.getCarReservations().stream()
                .map(res -> new DateRangeDTO(res.getRentalStart(), res.getRentalEnd()))
                .collect(Collectors.toList());

        dto.setReservedDates(reservedDates);

        return dto;
    }

}
