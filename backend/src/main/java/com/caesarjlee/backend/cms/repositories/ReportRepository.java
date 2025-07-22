package com.caesarjlee.backend.cms.repositories;

import com.caesarjlee.backend.cms.models.Report;
import com.caesarjlee.backend.cms.models.enumerations.ReportType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository <Report, Long>{
    Page <Report> findByUserId(Long userId, Pageable pageable);
    List <Report> findByReportType(ReportType reportType);
}