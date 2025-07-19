package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@Table("users")
public class User{
    @Id
    private Long id;
    private String username;
    private String password;
    @JsonProperty("first_name")
    private String firstName;
    @JsonProperty("last_name")
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private Boolean status;
    private String icon;
    private String description;
    @JsonProperty("created_at")
    private LocalDateTime createdAt;
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;
    private String comment;
    private String remark;

    private User(
            Long id,
            String username,
            String password,
            String firstName,
            String lastName,
            String email,
            String phone,
            String address,
            Boolean status,
            String icon,
            String description,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String comment,
            String remark
    ){
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.icon = icon;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.comment = comment;
        this.remark = remark;
    }

    public User of(
        String username,
        String password,
        String firstName,
        String lastName,
        String email,
        String phone,
        String address,
        Boolean status,
        String icon,
        String description,
        LocalDateTime createdAt,
        LocalDateTime updatedAt,
        String comment,
        String remark
    ){
        return new User(
            null,
            username,
            password,
            firstName,
            lastName,
            email,
            phone,
            address,
            status,
            icon,
            description,
            createdAt,
            updatedAt,
            comment,
            remark
        );
    }
}