package com.caesarjlee.cms.data_transfer_objects;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UserRegistrationDto(
    @NotBlank
    @Size(min = 3, max = 50)
    String username,

    @NotBlank
    @Size(min = 9, max = 255)
    String password,

    @NotBlank
    @Email
    String email,

    @NotBlank
    String phone,

    @NotBlank
    String firstName,

    @NotBlank
    String lastName,

    String diploma,

    String gender
){}