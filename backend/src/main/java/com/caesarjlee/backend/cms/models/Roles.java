package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@Table("roles")
public class Roles{
    private Long id;
    private String name;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Roles(
        Long id,
        String name,
        LocalDateTime createdAt
    ){
        this.id = id;
        this.name = name;
        this.createdAt = createdAt;
    }

    public Roles of(
        String name,
        LocalDateTime createdAt
    ){
        return new Roles(
            null,
            name,
            createdAt
        );
    }
}