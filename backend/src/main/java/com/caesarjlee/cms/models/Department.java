package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "departments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 100, message = "name length: (0, 100] characters")
    private String name;

    @Column(nullable = false)
    @Size(max = 65_535, message = "description length: [0, 65,535] characters")
    private String description;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    @JsonProperty("officer_id")
    private Long officerId;

    public static Department of(
        String name
    ){
        return new Department(
            null,
            name,
            null,
            LocalDateTime.now(),
            LocalDateTime.now(),
            null
        );
    }
    public static Department of(
        String name,
        String description
    ){
        return new Department(
            null,
            name,
            description,
            LocalDateTime.now(),
            LocalDateTime.now(),
            null
        );
    }

    public static Department of(
        String name,
        String description,
        Long officerId
    ){
        return new Department(
            null,
            name,
            description,
            LocalDateTime.now(),
            LocalDateTime.now(),
            officerId
        );
    }

    public static Department of(
        String name,
        String description,
        LocalDateTime createdAt,
        Long officerId
){
        return new Department(
            null,
            name,
            description,
            createdAt,
            LocalDateTime.now(),
            officerId
        );
    }
}