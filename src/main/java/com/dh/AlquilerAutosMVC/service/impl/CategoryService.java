package com.dh.AlquilerAutosMVC.service.impl;

import com.dh.AlquilerAutosMVC.repository.ICategoryRepository;
import com.dh.AlquilerAutosMVC.entity.Category;
import com.dh.AlquilerAutosMVC.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService implements ICategoryService {

    private ICategoryRepository categoryRepository;

    @Autowired
    public CategoryService(ICategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Optional<Category> findById(Long id) {
        return categoryRepository.findById(id);
    }

    @Override
    public void update(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public void delete(Long id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    // TODO: AGREGAR
    //  - Buscar por nombre de categoría

    /*
    @Override
    public Category findByName(String name) {
        return categoryIDao.findByString(name);
    }*/
}
