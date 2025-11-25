package com.dh.AlquilerAutosMVC.entity;

import com.dh.AlquilerAutosMVC.dto.CategoryDTO;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Table(name = "categories")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Long id;
    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "category")
    private List<Car> cars = new ArrayList<>();

    public Category() {
    }

    public Category(String name) {
        this.name = name;
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

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }

    public CategoryDTO toDTO() {
        CategoryDTO dto = new CategoryDTO();
        dto.setId(this.getId());
        dto.setName(this.getName());
        List<Long> carIds = this.getCars().stream()
                .map(Car::getId)
                .collect(Collectors.toList());

        dto.setCarsId(carIds);
        return dto;
    }
}
