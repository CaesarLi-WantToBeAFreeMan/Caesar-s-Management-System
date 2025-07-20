package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Table("departments")
public class Departments{
    private Long id;
    private String name;
    private String description;
    @JsonProperty("parent_department_id")
    private Long parentDepartmentId;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;
    @JsonProperty("manager_id")
    private Long managerId;

    @PersistenceCreator
    private Departments(
        Long id,
        String name,
        String description,
        Long parentDepartmentId,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        Long managerId
    ){
        this.id = id;
        this.name = name;
        this.description = description;
        this.parentDepartmentId = parentDepartmentId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.managerId = managerId;
    }

    public Departments of(
        String name,
        String description,
        Long parentDepartmentId,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        Long managerId
    ){
        return new Departments(
            null,
            name,
            description,
            parentDepartmentId,
            createdAt,
            updatedAt,
            managerId
        );
    }
}