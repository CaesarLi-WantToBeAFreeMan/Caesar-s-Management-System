package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.Currency;
import com.caesarjlee.backend.cms.models.enumerations.Gender;
import com.caesarjlee.backend.cms.models.enumerations.Language;
import com.caesarjlee.backend.cms.models.enumerations.Nationality;
import com.caesarjlee.backend.cms.validations.annotations.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Size(max = 50)
    private String username;
    @NotNull
    @ValidPassword
    @Size(min = 9, max = 255)
    private String password;
    @JsonProperty("first_name")
    @NotBlank
    @Size(max = 100)
    private String firstName;
    @JsonProperty("last_name")
    @NotBlank
    @Size(max = 100)
    private String lastName;
    @NotNull
    @ValidGender
    @Enumerated(EnumType.ORDINAL)
    private Gender gender;
    @NotBlank
    @Email
    @Size(max = 100)
    private String email;
    @NotBlank
    @ValidPhone
    @Size(max = 20)
    private String phone;
    @NotBlank
    @Size(max = 255)
    private String address;
    @Size(max = 255)
    private String diploma;
    @JsonProperty("department_id")
    private Long departmentId;
    @JsonProperty("hire_date")
    private LocalDate hireDate;
    @PositiveOrZero
    private BigDecimal salary;
    @NotNull
    @ValidCurrency
    @Enumerated(EnumType.STRING)
    @Column(name = "currency", length = 3)
    private Currency currency;
    @JsonProperty("first_language")
    @NotNull
    @ValidLanguage
    @Enumerated(EnumType.STRING)
    @Column(name = "first_language", length = 5)
    private Language firstLanguage;
    @JsonProperty("second_language")
    @ValidLanguage
    @Enumerated(EnumType.STRING)
    @Column(name = "second_language", length = 5)
    private Language secondLanguage;
    @JsonProperty("third_language")
    @ValidLanguage
    @Enumerated(EnumType.STRING)
    @Column(name = "third_language", length = 5)
    private Language thirdLanguage;
    @JsonProperty("first_nationality")
    @NotNull
    @ValidNationality
    @Enumerated(EnumType.STRING)
    @Column(name = "first_nationality", length = 3)
    private Nationality firstNationality;
    @JsonProperty("second_nationality")
    @ValidNationality
    @Enumerated(EnumType.STRING)
    @Column(name = "second_nationality", length = 3)
    private Nationality secondNationality;
    @JsonProperty("user_status")
    private Boolean userStatus;
    @Size(max = 255)
    private String icon;
    @Size(max = 65_535)
    private String description;
    @Size(max = 65_535)
    private String skills;
    @Size(max = 100)
    private String position;
    @Size(max = 50)
    private String provider;
    @JsonProperty("provider_id")
    @Size(max = 255)
    private String providerId;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;
    @Size(max = 65_535)
    private String comment;
    @Size(max = 65_535)
    private String remark;
}