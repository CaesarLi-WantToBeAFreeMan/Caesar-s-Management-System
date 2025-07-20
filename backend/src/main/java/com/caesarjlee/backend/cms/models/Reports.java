package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.ReportType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@Table("reports")
public class Reports{
    private Long id;
    @JsonProperty("user_id")
    private Long userId;
    @JsonProperty("report_type")
    private ReportType reportType;
    @JsonProperty("file_path")
    private String filePath;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Reports(
        Long id,
        Long userId,
        ReportType reportType,
        String filePath,
        LocalDateTime createdAt
    ){
        this.id = id;
        this.userId = userId;
        this.reportType = reportType;
        this.filePath = filePath;
        this.createdAt = createdAt;
    }

    public Reports of(
        Long userId,
        ReportType reportType,
        String filePath,
        LocalDateTime createdAt
    ){
        return new Reports(
            null,
            userId,
            reportType,
            filePath,
            createdAt
        );
    }
}