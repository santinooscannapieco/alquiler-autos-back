package com.dh.AlquilerAutosMVC.entity;

import com.dh.AlquilerAutosMVC.dto.CarReservationDTO;
import com.dh.AlquilerAutosMVC.dto.UserDTO;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User implements UserDetails  {
// Implementar UserDetails
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;
    @Column(name = "firstname")
    private String firstname;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "user")
    private List<CarReservation> carReservations = new ArrayList<>();

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + role.name()));
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    // Convierte entidad a DTO
    public UserDTO toDTO() {
        List<CarReservationDTO> reservationsDTO = carReservations.stream()
                .map(r -> new CarReservationDTO(
                        r.getId(),
                        r.getCar().getId(),
                        r.getUser().getId(),
                        r.getPickUp(),
                        r.getRentalStart().toString(),
                        r.getRentalEnd().toString()
                ))
                .collect(Collectors.toList());

        return new UserDTO(
                id,
                firstname,
                lastName,
                email,
                role,
                reservationsDTO
        );
    }

    // Convierte DTO a entidad (para creación/actualización)
    public static User fromDTO(UserDTO dto) {
        User user = new User();
        user.setId(dto.id());
        user.setFirstname(dto.firstname());
        user.setLastName(dto.lastName());
        user.setEmail(dto.email());
        user.setRole(dto.role());
        // Las reservas no las seteamos aquí, normalmente se manejan aparte
        return user;
    }
}
