package com.caesarjlee.backend.cms.dataTransmitObjects;

import com.caesarjlee.backend.cms.annotations.PasswordMatch;
import com.caesarjlee.backend.cms.annotations.ValidEmail;
import com.caesarjlee.backend.cms.annotations.ValidPassword;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;

@PasswordMatch
public record RegisterRequest(
    @NotBlank(message = "first name is required")//ensure the firstName filed is not null or empty, with a custom error message
    @JsonProperty("first_name")//map the JSON field `first_name` to the Java field `firstName`
    String firstName,

    @NotBlank(message = "last name is required")
    @JsonProperty("last_name")
    String lastName,

    @NotBlank(message = "email is required")
    @ValidEmail
    String email,

    @NotBlank(message = "password is required")
    @ValidPassword
    String password,

    @NotBlank(message = "password confirmation is required")
    @JsonProperty("password_confirm")
    String passwordConfirm
){}