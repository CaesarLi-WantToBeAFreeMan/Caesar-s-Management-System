package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Upload;
import com.caesarjlee.backend.cms.models.enumerations.UploadType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UploadRepository extends JpaRepository <Upload, Long>{
    Page <Upload> findByUserId(Long userId, Pageable pageable);
    List <Upload> findByUploadType(UploadType uploadType);
}