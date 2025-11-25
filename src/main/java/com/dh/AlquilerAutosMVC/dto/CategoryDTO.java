package com.dh.AlquilerAutosMVC.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CategoryDTO {
    private Long id;
    private String name;
    private List<Long> carsId = new ArrayList<>();
}
