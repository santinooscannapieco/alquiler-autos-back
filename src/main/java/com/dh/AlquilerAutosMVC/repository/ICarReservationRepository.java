package com.dh.AlquilerAutosMVC.repository;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ICarReservationRepository extends JpaRepository<CarReservation, Long> {
    List<CarReservation> findByUserId(Long userId);
    List<CarReservation> findByCarId(Long carId);

    @Query("""
            SELECT CASE WHEN COUNT(r) > 0 THEN true ELSE false END
            FROM CarReservation r
            WHERE r.car.id = :carId
            AND (r.rentalStart <= :endDate AND r.rentalEnd >= :startDate)
            """)
    boolean existsReservationOverlap(
            @Param("carId") Long carId,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
            );


}
