package com.dh.AlquilerAutosMVC.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CategoryDTO {
    private Long id;
    private String name;
    private List<Long> cars_id = new ArrayList<>();
}
