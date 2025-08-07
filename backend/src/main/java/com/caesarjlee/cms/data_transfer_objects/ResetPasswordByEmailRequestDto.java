package com.caesarjlee.cms.data_transfer_objects;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record ResetPasswordByEmailRequestDto(
        @NotBlank(message = "email is required")
        @Email(message = "invalid email format")
        String email
){}