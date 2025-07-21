package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.RequestStatus;
import com.caesarjlee.backend.cms.models.enumerations.RequestType;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestStatus;
import com.caesarjlee.backend.cms.validations.annotations.ValidRequestType;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@Table("requests")
public class Requests{
    private Long id;
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("request_type")
    @ValidRequestType
    private RequestType requestType;
    @Size(max = 65_535)
    private String details;
    @ValidRequestStatus
    private RequestStatus status;
    @JsonProperty("handler_id")
    private Long handlerId;
    @JsonProperty("handler_details")
    @Size(max = 65_535)
    private String handlerDetails;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    @PersistenceCreator
    private Requests(
        Long id,
        Long userId,
        RequestType requestType,
        String details,
        RequestStatus status,
        Long handlerId,
        String handlerDetails,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
    ){
        this.id = id;
        this.userId = userId;
        this.requestType = requestType;
        this.details = details;
        this.status = status;
        this.handlerId = handlerId;
        this.handlerDetails = handlerDetails;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Requests of(
        Long userId,
        RequestType requestType,
        String details,
        RequestStatus status,
        Long handlerId,
        String handlerDetails,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
    ){
        return new Requests(
            null,
            userId,
            requestType,
            details,
            status,
            handlerId,
            handlerDetails,
            createdAt,
            updatedAt
        );
    }
}