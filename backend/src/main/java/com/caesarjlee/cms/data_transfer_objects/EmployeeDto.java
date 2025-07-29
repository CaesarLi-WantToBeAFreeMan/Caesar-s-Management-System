package com.caesarjlee.cms.data_transfer_objects;

public record EmployeeDto(
        Long id,
        String firstName,
        String lastName,
        String email,
        String phone
){}