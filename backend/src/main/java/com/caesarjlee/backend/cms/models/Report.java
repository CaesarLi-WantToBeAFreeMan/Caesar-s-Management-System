package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.ReportType;
import com.caesarjlee.backend.cms.validations.annotations.ValidReportType;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "reports")
public class Report{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("report_type")
    @NotNull
    @ValidReportType
    @Enumerated(EnumType.ORDINAL)
    private ReportType reportType;
    @JsonProperty("file_path")
    @NotBlank
    @Size(max = 255)
    private String filePath;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
}