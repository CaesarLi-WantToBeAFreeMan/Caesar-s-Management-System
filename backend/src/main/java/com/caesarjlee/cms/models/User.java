package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
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
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    @JsonProperty("first_name")
    private String firstName;

    @Column(nullable = false)
    @Size(max = 50)
    @JsonProperty("last_name")
    private String lastName;

    @JsonProperty("gender_id")
    private Integer genderId;

    @Size(max = 100)
    private String email;

    @Size(max = 100)
    private String phone;

    @JsonProperty("diploma_id")
    private Integer diplomaId;

    @JsonProperty("department_id")
    private Integer departmentId;

    @JsonProperty("team_id")
    private Integer teamId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    @JsonProperty("role_id")
    private Role role;

    @JsonProperty("hire_date")
    private LocalDate hireDate;

    @Column(nullable = false)
    private BigDecimal salary;

    @Column(nullable = false)
    @JsonProperty("currency_id")
    private Integer currencyId;

    @Column(nullable = false)
    @JsonProperty("first_language_id")
    private Integer firstLanguageId;

    @JsonProperty("second_language_id")
    private Integer secondLanguageId;

    @JsonProperty("third_language_id")
    private Integer thirdLanguageId;

    @Column(nullable = false)
    @JsonProperty("first_nationality_id")
    private Integer firstNationalityId;

    @JsonProperty("second_nationality_id")
    private Integer secondNationalityId;

    @Column(nullable = false)
    private Boolean status;

    @Size(max = 255)
    private String icon;

    @Size(max = 65_535)
    private String description;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;
}