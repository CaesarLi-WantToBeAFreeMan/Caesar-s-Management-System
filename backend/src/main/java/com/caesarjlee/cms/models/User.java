package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    @NotBlank(message = "username is required")
    @Size(min = 3, max = 50, message = "username length: [3, 50] characters")
    private String username;

    @Column(nullable = false)
    @NotBlank(message = "password is required")
    @Size(min = 9, max = 255, message = "password length: [9, 255] characters")
    private String password;

    @Column(nullable = false)
    @NotBlank(message = "first name is required")
    @Size(max = 50, message = "first name length: (0, 50] characters")
    @JsonProperty("first_name")
    private String firstName;

    @Column(nullable = false)
    @NotNull(message = "last name is required")
    @Size(max = 50, message = "last name length: (0, 50] characters")
    @JsonProperty("last_name")
    private String lastName;

    @JsonProperty("gender_id")
    private Integer genderId;

    @Email(message = "invalid email format")
    @Size(min = 5, max = 100, message = "email length: [5, 100] characters")
    private String email;

    @Size(min = 4, max = 100, message = "phone length: [4, 100] characters")
    private String phone;

    @JsonProperty("diploma_id")
    private Integer diplomaId;

    @JsonProperty("department_id")
    private Integer departmentId;

    @JsonProperty("team_id")
    private Integer teamId;

    @Column(nullable = false)
    @NotNull(message = "role ID is required")
    @JsonProperty("role_id")
    private Integer roleId;

    @JsonProperty("hire_date")
    private LocalDate hireDate;

    @Column(nullable = false)
    @NotNull(message = "salary is required")
    @DecimalMin(value = "0.00", message = "salary must be non-negative")
    private BigDecimal salary;

    @Column(nullable = false)
    @NotNull(message = "currency ID is required")
    @JsonProperty("currency_id")
    private Integer currencyId;

    @Column(nullable = false)
    @NotNull(message = "first language ID is required")
    @JsonProperty("first_language_id")
    private Integer firstLanguageId;

    @JsonProperty("second_language_id")
    private Integer secondLanguageId;

    @JsonProperty("third_language_id")
    private Integer thirdLanguageId;

    @Column(nullable = false)
    @NotNull(message = "first nationality ID is required")
    @JsonProperty("first_nationality_id")
    private Integer firstNationalityId;

    @JsonProperty("second_nationality_id")
    private Integer secondNationalityId;

    @Column(nullable = false)
    @NotNull(message = "status is required")
    private Boolean status;

    @Size(max = 255, message = "icon length: [0, 255] characters")
    private String icon;

    @Size(max = 65_535, message = "description length: [0, 255] characters")
    private String description;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        Integer roleId
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            null,
            email,
            null,
            null,
            null,
            null,
            roleId,
            LocalDate.now(),
            BigDecimal.ZERO,
            141,
            16,
            null,
            null,
            235,
            null,
            true,
            null,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        String phone,
        Integer roleId
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            null,
            email,
            phone,
            null,
            null,
            null,
            roleId,
            LocalDate.now(),
            BigDecimal.ZERO,
            141,
            16,
            null,
            null,
            235,
            null,
            true,
            null,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        String phone,
        Integer roleId,
        Integer departmentId,
        Integer teamId
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            null,
            email,
            phone,
            null,
            departmentId,
            teamId,
            roleId,
            LocalDate.now(),
            BigDecimal.ZERO,
            141,
            16,
            null,
            null,
            235,
            null,
            true,
            null,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        String phone,
        Integer roleId,
        Integer departmentId,
        Integer teamId,
        BigDecimal salary
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            null,
            email,
            phone,
            null,
            departmentId,
            teamId,
            roleId,
            LocalDate.now(),
            salary,
            141,
            16,
            null,
            null,
            235,
            null,
            true,
            null,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        String phone,
        Integer roleId,
        Integer departmentId,
        Integer teamId,
        BigDecimal salary,
        Integer genderId,
        Integer diplomaId,
        Integer currencyId,
        Integer firstLanguageId,
        Integer firstNationalityId
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            genderId,
            email,
            phone,
            diplomaId,
            departmentId,
            teamId,
            roleId,
            LocalDate.now(),
            salary,
            currencyId,
            firstLanguageId,
            null,
            null,
            firstNationalityId,
            null,
            true,
            null,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static User of(
        String username,
        String password,
        String firstName,
        String lastName,
        Integer genderId,
        String email,
        String phone,
        Integer diplomaId,
        Integer departmentId,
        Integer teamId,
        Integer roleId,
        LocalDate hireDate,
        BigDecimal salary,
        Integer currencyId,
        Integer firstLanguageId,
        Integer secondLanguageId,
        Integer thirdLanguageId,
        Integer firstNationalityId,
        Integer secondNationalityId,
        Boolean status,
        String icon,
        String description,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            genderId,
            email,
            phone,
            diplomaId,
            departmentId,
            teamId,
            roleId,
            hireDate,
            salary,
            currencyId,
            firstLanguageId,
            secondLanguageId,
            thirdLanguageId,
            firstNationalityId,
            secondNationalityId,
            status,
            icon,
            description,
            createdAt,
            updatedAt
        );
    }
}