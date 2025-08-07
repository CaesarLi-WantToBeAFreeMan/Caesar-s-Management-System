package com.caesarjlee.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "messages")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotNull(message = "sender ID is required")
    @JsonProperty("sender_id")
    private Long senderId;

    @Column(nullable = false)
    @NotNull(message = "receiver ID is required")
    @JsonProperty("receiver_id")
    private Long receiverId;

    @Column(nullable = false)
    @NotBlank(message = "title is required")
    @Size(max = 50, message = "title length: (0, 50] characters")
    private String title;

    @Size(max = 65_535, message = "content length: [0, 65,535] characters")
    private String content;

    @Column(nullable = false)
    @NotNull(message = "read status is required")
    @JsonProperty("is_read")
    private Boolean isRead;

    @Column(nullable = false)
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @JsonProperty("read_at")
    private LocalDateTime readAt;

    public static Message of(
        Long senderId,
        Long receiverId,
        String title
    ){
        return new Message(
            null,
            senderId,
            receiverId,
            title,
            null,
            false,
            LocalDateTime.now(),
            null
        );
    }

    public static Message of(
        Long senderId,
        Long receiverId,
        String title,
        Boolean isRead
    ){
        return new Message(
            null,
            senderId,
            receiverId,
            title,
            null,
            isRead,
            LocalDateTime.now(),
            isRead ? LocalDateTime.now() : null
        );
    }

    public static Message of(
        Long senderId,
        Long receiverId,
        String title,
        String content
    ){
        return new Message(
            null,
            senderId,
            receiverId,
            title,
            content,
            false,
            LocalDateTime.now(),
            null
        );
    }

    public static Message of(
        Long senderId,
        Long receiverId,
        String title,
        String content,
        Boolean isRead
    ){
        return new Message(
            null,
            senderId,
            receiverId,
            title,
            content,
            isRead,
            LocalDateTime.now(),
            isRead ? LocalDateTime.now() : null
        );
    }

    public static Message of(
        Long senderId,
        Long receiverId,
        String title,
        String content,
        Boolean isRead,
        LocalDateTime createdAt,
        LocalDateTime readAt
    ){
        return new Message(
            null,
            senderId,
            receiverId,
            title,
            content,
            isRead,
            createdAt,
            readAt
        );
    }
}