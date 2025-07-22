package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.RequestStatus;
import com.caesarjlee.backend.cms.models.enumerations.RequestType;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestStatus;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestType;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "requests")
public class Request{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("request_type")
    @NotNull
    @ValidRequestType
    @Enumerated(EnumType.ORDINAL)
    private RequestType requestType;
    @JsonProperty("request_details")
    @Size(max = 65_535)
    private String requestDetails;
    @JsonProperty("requestStatus")
    @NotNull
    @ValidRequestStatus
    @Enumerated(EnumType.ORDINAL)
    private RequestStatus requestStatus;
    @JsonProperty("handler_id")
    private Long handlerId;
    @JsonProperty("handle_details")
    @Size(max = 65_535)
    private String handleDetails;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;
}