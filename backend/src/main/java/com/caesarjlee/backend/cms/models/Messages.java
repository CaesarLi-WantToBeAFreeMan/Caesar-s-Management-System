package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Table("messages")
public class Messages{
    private Long id;
    @JsonProperty("sender_id")
    private Long senderId;
    @JsonProperty("receiver_id")
    private Long receiverId;
    @NotNull
    private String title;
    @NotNull
    private String content;
    @JsonProperty("is_real")
    private Boolean isRead;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Messages(
        Long id,
        @JsonProperty("sender_id")
        @NotNull
        Long senderId,
        @JsonProperty("receiver_id")
        @NotNull
        Long receiverId,
        @Size(max = 50)
        String title,
        @NotBlank
        @Size(max = 65_535)
        String content,
        @JsonProperty("is_read")
        Boolean isRead,
        @JsonProperty("created_at")
        LocalDateTime createdAt
    ){
        this.id = id;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.title = title;
        this.content = content;
        this.isRead = isRead;
        this.createdAt = createdAt;
    }

    public Messages of(
        Long senderId,
        Long receiverId,
        String title,
        String content,
        Boolean isRead,
        LocalDateTime createdAt
    ){
        return new Messages(
            null,
            senderId,
            receiverId,
            title,
            content,
            isRead,
            createdAt
        );
    }
}