package com.caesarjlee.backend.cms.models;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

@Setter
@Getter
@ToString
@Table("skills")
public class Skills{
    private Long id;
    private String name;
    private String description;

    @PersistenceCreator
    private Skills(
        Long id,
        String name,
        String description
    ){
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public Skills of(
        String name,
        String description
    ){
        return new Skills(
            null,
            name,
            description
        );
    }
}