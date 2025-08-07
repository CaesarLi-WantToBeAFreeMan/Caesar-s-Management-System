package com.caesarjlee.cms.data_transfer_objects;

import com.caesarjlee.cms.exceptions.PasswordResetException;
import com.caesarjlee.cms.validations.ValidPassword;
import com.caesarjlee.cms.validations.ValidVerificationCode;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record ResetPasswordRequestDto(
    @NotBlank(message = "login is required")
    String login,

    @NotNull(message = "password is required")
    @ValidPassword
    String password,

    @NotNull(message = "passwords mismatch")
    @ValidPassword
    @JsonProperty("confirm_password")
    String confirmPassword,

    @NotNull(message = "verification code is required")
    @ValidVerificationCode
    @JsonProperty("verification_code")
    String verificationCode
){
    public ResetPasswordRequestDto{
        if(!password.equals(confirmPassword))
            throw new PasswordResetException("passwords mismatch");
    }
}