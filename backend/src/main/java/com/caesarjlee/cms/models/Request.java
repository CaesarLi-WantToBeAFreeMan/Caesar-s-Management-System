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
@Table(name = "requests")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Request{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @NotNull(message = "user ID is required")
    @JsonProperty("user_id")
    private Long userId;

    @Column(nullable = false)
    @NotNull(message = "type ID is required")
    @JsonProperty("type_id")
    private Integer typeId;

    @Size(max = 65_535, message = "details length: [0, 65,535] characters")
    private String details;

    @Column(nullable = false)
    @NotNull(message = "status is required")
    private Integer status;

    @Column(nullable = false)
    @NotNull(message = "handler ID is required")
    @JsonProperty("handler_id")
    private Long handlerId;

    @Size(max = 65_535, message = "handle details length: [0, 65,535] characters")
    @JsonProperty("handle_details")
    private String handleDetails;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    public static Request of(
        Long userId,
        Long handlerId,
        Integer typeId
    ){
        return new Request(
            null,
            userId,
            typeId,
            null,
            1,
            handlerId,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static Request of(
        Long userId,
        Long handlerId,
        Integer typeId,
        String details
    ){
        return new Request(
            null,
            userId,
            typeId,
            details,
            1,
            handlerId,
            null,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static Request of(
        Long userId,
        Long handlerId,
        Integer typeId,
        String details,
        String handleDetails
    ){
        return new Request(
            null,
            userId,
            typeId,
            details,
            1,
            handlerId,
            handleDetails,
            LocalDateTime.now(),
            LocalDateTime.now()
        );
    }

    public static Request of(
        Long userId,
        Long handlerId,
        Integer typeId,
        String details,
        String handleDetails,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
    ){
        return new Request(
            null,
            userId,
            typeId,
            details,
            1,
            handlerId,
            handleDetails,
            createdAt,
            updatedAt
        );
    }
}