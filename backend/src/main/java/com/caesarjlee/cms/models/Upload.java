package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "uploads")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Upload{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotNull(message = "user ID is required")
    @JsonProperty("user_id")
    private Long userId;

    @Column(nullable = false)
    @NotNull(message = "file type ID is required")
    @JsonProperty("file_type_id")
    private Integer fileTypeId;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    public static Upload of(
        Long userId
    ){
        return new Upload(
            null,
            userId,
            5,
            LocalDateTime.now()
        );
    }

    public static Upload of(
        Long userId,
        Integer fileTypeId
    ){
        return new Upload(
            null,
            userId,
            fileTypeId,
            LocalDateTime.now()
        );
    }

    public static Upload of(
        Long userId,
        Integer fileTypeId,
        LocalDateTime createdAt
    ){
        return new Upload(
            null,
            userId,
            fileTypeId,
            createdAt
        );
    }
}