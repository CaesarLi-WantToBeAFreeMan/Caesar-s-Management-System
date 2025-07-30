package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "currencies")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Currency{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "abbreviation is required")
    @Size(min = 3, max = 3, message = "abbreviation length: 3 characters")
    private String abbreviation;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 50, message = "name length: (0, 50] characters")
    private String name;

    public static Currency of(
        String abbreviation,
        String name
    ){
        return new Currency(
            null,
            abbreviation,
            name
        );
    }
}