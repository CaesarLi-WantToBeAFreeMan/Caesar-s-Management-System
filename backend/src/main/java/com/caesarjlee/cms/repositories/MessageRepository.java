package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface MessageRepository extends JpaRepository <Message, Long>{
    Page <Message> findBySenderId(Long senderId, Pageable pageable);
    Page <Message> findByReceiverId(Long receiverId, Pageable pageable);
    Page <Message> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);
    Page <Message> findByReadAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);

    Boolean existsBySenderId(Long senderId);
    Boolean existsByReceiverId(Long receiverId);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Boolean existsByReadAtBetween(LocalDateTime start, LocalDateTime end);

    Long countBySenderId(Long senderId);
    Long countByReceiverId(Long receiverId);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    Long countByReadAtBetween(LocalDateTime start, LocalDateTime end);
}