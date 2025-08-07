package com.caesarjlee.cms.data_transfer_objects;

import com.caesarjlee.cms.exceptions.RegisterException;
import com.caesarjlee.cms.validations.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record RegisterRequestDto(
    @NotBlank(message = "username is required")
    @ValidUsername
    @UniqueUsername
    String username,

    @NotBlank(message = "password is required")
    @ValidPassword
    String password,

    @NotBlank(message = "first name is required")
    @ValidFirstName
    @JsonProperty("first_name")
    String firstName,

    @NotBlank(message = "last name is required")
    @ValidLastName
    @JsonProperty("last_name")
    String lastName,

    @Email(message = "invalid email format")
    @UniqueEmail
    String email,

    @ValidPhone
    @UniquePhone
    String phone,

    @NotBlank(message = "confirm password is required")
    @ValidPassword
    @JsonProperty("confirm_password")
    String confirmPassword
){
    public RegisterRequestDto{
        if((email == null || email.isBlank()) && (phone == null || phone.isBlank()))
            throw new RegisterException("either email or phone must be provided");
    }
}