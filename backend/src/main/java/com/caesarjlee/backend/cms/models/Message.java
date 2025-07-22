package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "messages")
public class Message{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("sender_id")
    @NotNull
    private Long senderId;
    @JsonProperty("receiver_id")
    @NotNull
    private Long receiverId;
    @JsonProperty("message_title")
    @NotBlank
    @Size(max = 50)
    private String messageTitle;
    @JsonProperty("message_content")
    @NotBlank
    @Size(max = 65_535)
    private String messageContent;
    @JsonProperty("is_read")
    private Boolean isRead;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
}