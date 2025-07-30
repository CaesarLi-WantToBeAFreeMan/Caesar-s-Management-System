package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "nationalities")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Nationality{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "abbreviation is required")
    @Size(min = 3, max = 3, message = "abbreviation must be 3 characters")
    private String abbreviation;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 55, message = "name length: (0, 55] characters")
    private String name;

    public static Nationality of(
        String abbreviation,
        String name
    ){
        return new Nationality(
            null,
            abbreviation,
            name
        );
    }
}