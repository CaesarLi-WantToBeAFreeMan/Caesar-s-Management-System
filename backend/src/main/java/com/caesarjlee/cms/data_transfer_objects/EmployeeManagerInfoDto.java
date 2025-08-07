package com.caesarjlee.cms.data_transfer_objects;

public record EmployeeManagerInfoDto(
    String username,
    String firstName,
    String lastName,
    String gender,
    String diploma,
    String department,
    String team,
    String role,
    String firstLanguage,
    String secondLanguage,
    String thirdLanguage,
    Boolean status,
    String icon,
    String description
){}