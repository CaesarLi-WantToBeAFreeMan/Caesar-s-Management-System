package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "languages")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Language{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "abbreviation is required")
    @Size(min = 5, max = 5, message = "abbreviation must be 5 characters")
    private String abbreviation;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 50, message = "name length: (0, 50] characters")
    private String name;

    public static Language of(
        String abbreviation,
        String name
    ){
        return new Language(
            null,
            abbreviation,
            name
        );
    }
}