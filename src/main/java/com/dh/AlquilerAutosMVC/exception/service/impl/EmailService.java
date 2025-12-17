package com.dh.AlquilerAutosMVC.exception.service.impl;

import com.dh.AlquilerAutosMVC.entity.CarReservation;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.Objects;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    /* Este método es usado para ejecutar el Test */
    public void sendSimpleEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);

        mailSender.send(message);
    }

    public void sendReservationConfirmation(CarReservation reservation, String type) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(reservation.getUser().getEmail());

            if (Objects.equals(type, "create")) {
                helper.setSubject("Confirmación de tu reserva con AlquilerAutos");

            } else if (Objects.equals(type, "update")) {
                helper.setSubject("Confirmación de los cambios en tu reserva");
            }

            String html = buildReservationHtml(reservation, type);
            helper.setText(html, true);
            mailSender.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException("Error enviando email de reserva", e);
        }
    }

    private String buildReservationHtml(CarReservation r, String type) {
        String htmlToReturn = switch (type) {
            case "create" -> """
                    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: auto;">
                                    <h2 style="color:#2563eb;">¡Reserva confirmada!</h2>
                                    
                                    <p>Hola <strong>%s</strong>, <strong>%s</strong></p>
                                    
                                    <p>Tu reserva fue confirmada con éxito. Estos son los detalles:</p>
                                    
                                    <ul>
                                        <li><strong>Auto:</strong> %s %s</li>
                                        <li><strong>Desde:</strong> %s</li>
                                        <li><strong>Hasta:</strong> %s</li>
                                        <li><strong>Método de pago:</strong> %s</li>
                                        <li><strong>Precio total:</strong> $%.2f</li>
                                    </ul>
                                    
                                    <p>Lugar de retiro y devolución del vehículo:</p>
                                    <p>%s, %s, %s</p>
                                    
                                    
                                    <h3>Datos del proveedor</h3>
                                    <ul>
                                        <li><strong>Nombre:</strong> Santino Scannapieco</li>
                                        <li><strong>Email:</strong> santinoscannapieco@gmail.com</li>
                                    </ul>
                                    
                                    <p style="margin-top: 30px;">
                                        Gracias por confiar en nosotros!!!
                                    </p>
                                </div>
                    """.formatted(
                    r.getUser().getFirstname(),
                    r.getUser().getLastName(),
                    r.getCar().getCarBrand(),
                    r.getCar().getName(),
                    r.getRentalStart(),
                    r.getRentalEnd(),
                    r.getPaymentMethod(),
                    r.getTotalPrice(),
                    r.getPickUp().get(0),
                    r.getPickUp().get(1),
                    r.getPickUp().get(2)

            );
            case "update" -> """
                    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: auto;">
                                    <h2 style="color:#2563eb;">¡Confirmadas las modificaciones en su reserva!</h2>
                                    
                                    <p>Hola <strong>%s</strong>, <strong>%s</strong></p>
                                    
                                    <p>Los cambios en tu reserva fueron confirmados con éxito. Estos son los detalles:</p>
                                    
                                    <ul>
                                        <li><strong>Auto:</strong> %s %s</li>
                                        <li><strong>Desde:</strong> %s</li>
                                        <li><strong>Hasta:</strong> %s</li>
                                        <li><strong>Método de pago:</strong> %s</li>
                                        <li><strong>Precio total:</strong> $%.2f</li>
                                    </ul>
                                    
                                    <p>Lugar de retiro y devolución del vehículo:</p>
                                    <p>%s, %s, %s</p>
                                    
                                    
                                    <h3>Datos del proveedor</h3>
                                    <ul>
                                        <li><strong>Nombre:</strong> Santino Scannapieco</li>
                                        <li><strong>Email:</strong> santinoscannapieco@gmail.com</li>
                                    </ul>
                                    
                                    <p style="margin-top: 30px;">
                                        Gracias por confiar en nosotros!!!
                                    </p>
                                </div>
                    """.formatted(
                    r.getUser().getFirstname(),
                    r.getUser().getLastName(),
                    r.getCar().getCarBrand(),
                    r.getCar().getName(),
                    r.getRentalStart(),
                    r.getRentalEnd(),
                    r.getPaymentMethod(),
                    r.getTotalPrice(),
                    r.getPickUp().get(0),
                    r.getPickUp().get(1),
                    r.getPickUp().get(2)

            );
            default -> null;
        };

        return htmlToReturn;
    }
}
