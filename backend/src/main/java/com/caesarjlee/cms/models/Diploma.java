package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "diplomas")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Diploma{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "abbreviation is required")
    @Size(max = 10, message = "abbreviation length: (0, 10] characters")
    private String abbreviation;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 50, message = "name length: (0, 50] characters")
    private String name;

    public static Diploma of(
        String abbreviation,
        String name
    ){
        return new Diploma(
            null,
            abbreviation,
            name
        );
    }
}