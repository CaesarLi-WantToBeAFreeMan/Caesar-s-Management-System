package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "logs")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Log{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotNull(message = "user ID is required")
    @JsonProperty("user_id")
    private Long userId;

    @Column(nullable = false)
    @NotNull(message = "type ID is required")
    @JsonProperty("type_id")
    private Integer typeId;

    @Size(max = 65_535, message = "details length: [0, 65_535] characters")
    private String details;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    public static Log of(
        Long userId,
        Integer typeId
    ){
        return new Log(
            null,
            userId,
            typeId,
            null,
            LocalDateTime.now()
        );
    }

    public static Log of(
        Long userId,
        Integer typeId,
        String details,
        LocalDateTime createdAt
    ){
        return new Log(
            null,
            userId,
            typeId,
            details,
            createdAt
        );
    }
}