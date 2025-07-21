package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.Currency;
import com.caesarjlee.backend.cms.models.enumerations.Gender;
import com.caesarjlee.backend.cms.models.enumerations.Language;
import com.caesarjlee.backend.cms.models.enumerations.Nationality;
import com.caesarjlee.backend.cms.validations.annotations.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@Table("users")
public class Users{
    @Id
    private Long id;
    @NotBlank
    @Size(max = 50)
    private String username;
    @NotBlank
    @ValidPassword
    private String password;
    @JsonProperty("first_name")
    @NotBlank
    @Size(max = 100)
    private String firstName;
    @JsonProperty("last_name")
    @NotBlank
    @Size(max = 100)
    private String lastName;
    @NotBlank
    @ValidGender
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
    @ValidCurrency
    private Currency currency;
    @JsonProperty("first_language")
    @ValidLanguage
    private Language firstLanguage;
    @JsonProperty("second_language")
    @ValidLanguage
    private Language secondLanguage;
    @JsonProperty("third_language")
    @ValidLanguage
    private Language thirdLanguage;
    @JsonProperty("first_nationality")
    @ValidNationality
    private Nationality firstNationality;
    @JsonProperty("second_nationality")
    @ValidNationality
    private Nationality secondNationality;
    private Boolean status;
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

    @PersistenceCreator
    private Users(
            Long id,
            String username,
            String password,
            String firstName,
            String lastName,
            Gender gender,
            String email,
            String phone,
            String address,
            String diploma,
            Long departmentId,
            LocalDate hireDate,
            BigDecimal salary,
            Currency currency,
            Language firstLanguage,
            Language secondLanguage,
            Language thirdLanguage,
            Nationality firstNationality,
            Nationality secondNationality,
            Boolean status,
            String icon,
            String description,
            String skills,
            String position,
            String provider,
            String providerId,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String comment,
            String remark
    ){
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.diploma = diploma;
        this.departmentId = departmentId;
        this.hireDate = hireDate;
        this.salary = salary;
        this.currency = currency;
        this.firstLanguage = firstLanguage;
        this.secondLanguage = secondLanguage;
        this.thirdLanguage = thirdLanguage;
        this.firstNationality = firstNationality;
        this.secondNationality = secondNationality;
        this.status = status;
        this.icon = icon;
        this.description = description;
        this.skills = skills;
        this.position = position;
        this.provider = provider;
        this.providerId = providerId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.comment = comment;
        this.remark = remark;
    }

    public Users of(
        String username,
        String password,
        String firstName,
        String lastName,
        Gender gender,
        String email,
        String phone,
        String address,
        String diploma,
        Long departmentId,
        LocalDate hireDate,
        BigDecimal salary,
        Currency currency,
        Language firstLanguage,
        Language secondLanguage,
        Language thirdLanguage,
        Nationality firstNationality,
        Nationality secondNationality,
        Boolean status,
        String icon,
        String description,
        String skills,
        String position,
        String provider,
        String providerId,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        String comment,
        String remark
    ){
        return new Users(
            null,
            username,
            password,
            firstName,
            lastName,
            gender,
            email,
            phone,
            address,
            diploma,
            departmentId,
            hireDate,
            salary,
            currency,
            firstLanguage,
            secondLanguage,
            thirdLanguage,
            firstNationality,
            secondNationality,
            status,
            icon,
            description,
            skills,
            position,
            provider,
            providerId,
            createdAt,
            updatedAt,
            comment,
            remark
        );
    }
}