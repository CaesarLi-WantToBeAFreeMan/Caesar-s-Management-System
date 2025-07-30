package com.caesarjlee.cms.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "request_status")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestStatus{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "type is required")
    @Size(max = 50, message = "type length: (0, 50] characters")
    private String type;

    public static RequestStatus of(
        String type
    ){
        return new RequestStatus(
            null,
            type
        );
    }
}