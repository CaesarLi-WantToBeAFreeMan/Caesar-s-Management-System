package com.caesarjlee.cms.data_transfer_objects;

public record AuthenticationResponseDto(
    String token,
    String message
){}