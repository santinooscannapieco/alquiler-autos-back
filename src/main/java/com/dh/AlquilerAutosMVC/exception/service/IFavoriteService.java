package com.dh.AlquilerAutosMVC.exception.service;

import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;

import java.util.List;

public interface IFavoriteService {

    public List<CarDTO> getFavorites(User user) throws ResourceNotFoundException;

    public CarDTO addFavorite(User user, Long carId) throws ResourceNotFoundException;

    public void removeFavorite(User user, Long carId) throws ResourceNotFoundException;

}
