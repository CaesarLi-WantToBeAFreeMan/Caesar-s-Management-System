package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "teams")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Team{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @NotNull(message = "department ID is required")
    @JsonProperty("department_id")
    private Integer departmentId;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 100, message = "name length: (0, 100] characters")
    private String name;

    @Size(max = 65_535, message = "description length: [0, 65,535] characters")
    private String description;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    @JsonProperty("manager_id")
    private Long managerId;

    public static Team of(
        String name
    ){
        return new Team(
            null,
            null,
            name,
            null,
            LocalDateTime.now(),
            LocalDateTime.now(),
            null
        );
    }

    public static Team of(
        String name,
        String description
    ){
        return new Team(
            null,
            null,
            name,
            description,
            LocalDateTime.now(),
            LocalDateTime.now(),
            null
        );
    }

    public static Team of(
        String name,
        String description,
        Integer departmentId
    ){
        return new Team(
            null,
            departmentId,
            name,
            description,
            LocalDateTime.now(),
            LocalDateTime.now(),
            null
        );
    }

    public static Team of(
        String name,
        String description,
        Integer departmentId,
        LocalDateTime createdAt
    ){
        return new Team(
            null,
            departmentId,
            name,
            description,
            createdAt,
            LocalDateTime.now(),
            null
        );
    }

    public static Team of(
        String name,
        String description,
        Integer departmentId,
        Long managerId
    ){
        return new Team(
            null,
            departmentId,
            name,
            description,
            LocalDateTime.now(),
            LocalDateTime.now(),
            managerId
        );
    }
    public static Team of(
        String name,
        String description,
        Integer departmentId,
        Long managerId,
        LocalDateTime createdAt
    ){
        return new Team(
            null,
            departmentId,
            name,
            description,
            createdAt,
            LocalDateTime.now(),
            managerId
        );
    }
}