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
        UserDTO dto = new UserDTO();
        dto.setId(this.id);
        dto.setFirstname(this.firstname);
        dto.setLastName(this.lastName);
        dto.setEmail(this.email);
        dto.setRole(this.role);

        if (this.carReservations != null) {
            dto.setCarReservations(
                    this.carReservations.stream()
                            .map(CarReservation::toDTO)
                            .collect(Collectors.toList())
            );
        }

        return dto;
    }

    // Convierte DTO a entidad (para creación/actualización)
    public static User fromDTO(UserDTO dto, List<CarReservation> reservations) {
        User user = new User();
        user.setId(dto.getId());
        user.setFirstname(dto.getFirstname());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setRole(dto.getRole());

        user.setCarReservations(reservations);

        return user;
    }

    public void updateFromDTO(UserDTO dto, boolean canUpdateRole) {
        if (dto.getFirstname() != null) this.firstname = dto.getFirstname();
        if (dto.getLastName() != null) this.lastName = dto.getLastName();
        if (dto.getEmail() != null) this.email = dto.getEmail();
        // Si llega el rol, lo actualizamos también
        if (canUpdateRole && dto.getRole() != null) {
            this.role = dto.getRole();
        }
    }
}
