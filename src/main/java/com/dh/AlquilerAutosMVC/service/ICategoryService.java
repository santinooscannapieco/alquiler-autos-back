package com.dh.AlquilerAutosMVC.service;

import com.dh.AlquilerAutosMVC.entity.Category;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {

    Category save(Category category);
    Optional<Category> findById(Long id);
    void update(Category category);
    void delete(Long id);
    List<Category> findAll();
}
