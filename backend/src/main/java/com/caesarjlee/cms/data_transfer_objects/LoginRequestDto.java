package com.caesarjlee.cms.data_transfer_objects;

import com.caesarjlee.cms.validations.ValidLogin;
import com.caesarjlee.cms.validations.ValidPassword;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record LoginRequestDto(
    @NotBlank(message = "login is required")
    @ValidLogin
    String login,

    @NotBlank(message = "password is required")
    @ValidPassword
    String password
){}