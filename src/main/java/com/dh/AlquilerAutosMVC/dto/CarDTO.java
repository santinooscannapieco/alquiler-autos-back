package com.dh.AlquilerAutosMVC.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CarDTO {
    private Long id;
    private String name;
    private String description;
    private List<String> imagePaths;
    private String carBrand;
    private Integer pricePerHour;
    private List<String> characteristics;
    private Long category_id;
    private List<DateRangeDTO> reservedDates = new ArrayList<>();
}
