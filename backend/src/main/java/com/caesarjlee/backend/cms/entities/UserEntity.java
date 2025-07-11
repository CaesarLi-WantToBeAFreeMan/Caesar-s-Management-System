package com.caesarjlee.backend.cms.entities;

import jakarta.persistence.*;

import java.math.BigInteger;
import java.time.LocalDateTime;

@Entity
@Table(name = "cms_users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;//primary key id

    @Column(nullable = false)
    private String email;//email address

    @Column(unique = true, nullable = false)
    private String username;//username

    @Column(nullable = false)
    private String password;//username password

    @Column(name = "creation_datetime", nullable = false)
    private LocalDateTime creationDateTime;//date and time of creation

    @Column(nullable = false)
    private Boolean status;//status of account, true for active, false for disabled

    //setters

    public void setId(Long id){
        this.id = id;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public void setCreationDateTime(LocalDateTime creationDateTime){
        this.creationDateTime = creationDateTime;
    }

    public void setStatus(Boolean status){
        this.status = status;
    }

    //getters

    public Long getId(){
        return id;
    }

    public String getEmail(){
        return email;
    }

    public String getUsername(){
        return username;
    }

    public String getPassword(){
        return password;
    }

    public LocalDateTime getCreationDateTime(){
        return creationDateTime;
    }

    public Boolean getStatus(){
        return status;
    }
}