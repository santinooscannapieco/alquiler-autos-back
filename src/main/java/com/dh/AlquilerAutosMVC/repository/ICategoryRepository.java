package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICategoryRepository extends JpaRepository<Category, Long> {
}
