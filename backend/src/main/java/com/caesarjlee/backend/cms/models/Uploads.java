package com.caesarjlee.backend.cms.models;

import com.caesarjlee.backend.cms.models.enumerations.UploadType;
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
@Table("uploads")
public class Uploads{
    private Long id;
    @JsonProperty("user_id")
    private Long userId;
    @JsonProperty("upload_type")
    private UploadType uploadType;
    @JsonProperty("file_path")
    private String filePath;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @PersistenceCreator
    private Uploads(
        Long id,
        Long userId,
        UploadType uploadType,
        String filePath,
        LocalDateTime createdAt
    ){
        this.id = id;
        this.userId = userId;
        this.uploadType = uploadType;
        this.filePath = filePath;
        this.createdAt = createdAt;
    }

    public Uploads of(
        Long userId,
        UploadType uploadType,
        String filePath,
        LocalDateTime createdAt
    ){
        return new Uploads(
            null,
            userId,
            uploadType,
            filePath,
            createdAt
        );
    }
}