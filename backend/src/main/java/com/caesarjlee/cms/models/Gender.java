package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "genders")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gender{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "name is required")
    @Size(max = 50, message = "name length: (0, 50] characters")
    private String name;

    public static Gender of(
        String name
    ){
        return new Gender(
            null,
            name
        );
    }
}