package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.auth.AuthenticationService;
import com.dh.AlquilerAutosMVC.dto.CarDTO;
import com.dh.AlquilerAutosMVC.entity.User;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.impl.FavoriteServiceImpl;
import com.dh.AlquilerAutosMVC.repository.IUserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/favoritos")
@RequiredArgsConstructor
public class FavoriteController {

    private final FavoriteServiceImpl favoriteService;
    private final IUserRepository iUserRepository;
    private final AuthenticationService authService;

    @GetMapping
    public List<CarDTO> getFavorites() throws ResourceNotFoundException {
        return favoriteService.getFavorites(authService.getCurrentUser());
    }

    @PostMapping("/{carId}")
    public ResponseEntity<CarDTO> addFavorite(@PathVariable Long carId) throws ResourceNotFoundException {
        CarDTO dto = favoriteService.addFavorite(authService.getCurrentUser(), carId);
        return ResponseEntity.ok(dto);
    }

    @DeleteMapping("/{carId}")
    public ResponseEntity<Void> removeFavorite(@PathVariable Long carId) throws ResourceNotFoundException {
        favoriteService.removeFavorite(authService.getCurrentUser(), carId);
        return ResponseEntity.noContent().build();
    }
}
