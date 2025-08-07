package com.caesarjlee.cms.repositories;

import com.caesarjlee.cms.models.Upload;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface UploadRepository extends JpaRepository <Upload, Long>{
    Page <Upload> findByUserId(Long userId, Pageable pageable);
    Page <Upload> findByFileTypeId(Integer fileTypeId, Pageable pageable);
    Page <Upload> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end, Pageable pageable);

    Boolean existsByUserId(Long userId);
    Boolean existsByFileTypeId(Integer fileTypeId);
    Boolean existsByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    Long countByUserId(Long userId);
    Long countByFileTypeId(Integer fileTypeId);
    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
}