package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.ActionType;
import com.caesarjlee.backend.cms.validations.annotations.ValidActionType;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Table("logs")
public class Logs{
    private Long id;
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("action_type")
    @ValidActionType
    private ActionType actionType;
    @JsonProperty("action_details")
    private String actionDetails;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Logs(
        Long id,
        Long userId,
        ActionType actionType,
        String actionDetails,
        LocalDateTime createdAt
    ){
        this.id = id;
        this.userId = userId;
        this.actionType = actionType;
        this.actionDetails = actionDetails;
        this.createdAt = createdAt;
    }

    public Logs of(
        Long userId,
        ActionType actionType,
        String actionDetails,
        LocalDateTime createdAt
    ){
        return new Logs(
            null,
            userId,
            actionType,
            actionDetails,
            createdAt
        );
    }
}