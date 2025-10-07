package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.dto.UserDTO;
import com.dh.AlquilerAutosMVC.exception.ResourceNotFoundException;
import com.dh.AlquilerAutosMVC.exception.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.nio.file.AccessDeniedException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/usuarios")
public class UserController {

    private final IUserService iUserService;

    @Autowired
    public UserController(IUserService iUserService) {
        this.iUserService = iUserService;
    }



    @PutMapping
    @PreAuthorize("#userDTO.id == authentication.principal.id or hasRole('ADMIN')")
    public ResponseEntity<?> update(@RequestBody UserDTO userDTO, Authentication auth) throws ResourceNotFoundException, AccessDeniedException {
        try {
            iUserService.update(userDTO, auth);
            return ResponseEntity.ok("Usuario actualizado correctamente");
        } catch (AccessDeniedException e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(e.getMessage());
        } catch (ResourceNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<String> delete(@PathVariable Long id) throws ResourceNotFoundException {
        iUserService.delete(id);
        return ResponseEntity.ok("Se eliminó el usuario con id: " + id);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDTO> findById(@PathVariable Long id) throws ResourceNotFoundException {
        Optional<UserDTO> userDTO = iUserService.findById(id);

        return userDTO.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<List<UserDTO>> findAll() {
        return ResponseEntity.ok(iUserService.findAll());
    }

    @GetMapping("/email")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDTO> findByEmail(@RequestParam String email) {
        Optional<UserDTO> userDTO = iUserService.findByEmail(email);

        return userDTO.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }
}
