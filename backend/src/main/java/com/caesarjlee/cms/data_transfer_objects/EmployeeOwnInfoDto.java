package com.caesarjlee.cms.data_transfer_objects;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public record EmployeeOwnInfoDto(
    Long id,
    String username,
    String password,
    String firstName,
    String lastName,
    String gender,
    String diploma,
    String email,
    String phone,
    String department,
    String team,
    String role,
    LocalDate hireDate,
    BigDecimal salary,
    String currency,
    String firstLanguage,
    String secondLanguage,
    String thirdLanguage,
    String firstNationality,
    String secondNationality,
    Boolean status,
    String icon,
    String description,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
){}