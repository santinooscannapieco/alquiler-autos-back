package com.dh.AlquilerAutosMVC.controller;

import com.dh.AlquilerAutosMVC.exception.service.impl.EmailService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class EmailControllerTest {

    private final EmailService emailService;

    public EmailControllerTest(EmailService emailService) {
        this.emailService = emailService;
    }

    @GetMapping("/mail")
    public String testMail() {
        emailService.sendSimpleEmail(
                "santinoscannapieco@gmail.com",
                "Mail de prueba",
                "Si recibo, Spring Mail funciona!"
        );
        return "Mail enviado";
    }
}
