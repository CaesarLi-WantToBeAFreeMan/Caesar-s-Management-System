package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository <Message, Long>{
    Page <Message> findBySenderId(Long senderId, Pageable pageable);
    Page <Message> findByReceiverId(Long receiverId, Pageable pageable);
    List <Message> findBySenderIdAndReceiverId(Long senderId, Long receiverId);
    List <Message> findByReceiverIdAndIsReadFalse(Long receiverId);
}