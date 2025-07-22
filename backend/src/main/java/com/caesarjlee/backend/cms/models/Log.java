package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.ActionType;
import com.caesarjlee.backend.cms.validations.annotations.ValidActionType;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "logs")
public class Log{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("action_type")
    @NotNull
    @ValidActionType
    @Enumerated(EnumType.ORDINAL)
    private ActionType actionType;
    @JsonProperty("action_details")
    private String actionDetails;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
}