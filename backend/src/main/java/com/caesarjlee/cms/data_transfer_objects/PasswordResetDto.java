package com.caesarjlee.cms.data_transfer_objects;

public record PasswordResetDto(
        String emailOrPhone,
        String code
){}