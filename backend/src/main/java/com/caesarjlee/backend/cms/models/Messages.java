package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
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
    private String title;
    private String content;
    @JsonProperty("is_real")
    private Boolean isRead;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Messages(
        Long id,
        Long senderId,
        Long receiverId,
        String title,
        String content,
        Boolean isRead,
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