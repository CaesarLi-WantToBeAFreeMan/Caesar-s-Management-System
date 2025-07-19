package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

@Setter//generate setters for all fields
@Getter//generate getters for all fields
@ToString//generate toString() method
@Table("CMS_USERS")//map the class to the `CMS_USERS` table
public class User{
    @Id//mark the id field as the primary key
    private Long id;

    @JsonProperty("first_name")//map JSON field `first_name` to Java field `firstName`
    private String firstName;

    @JsonProperty("last_name")
    private String lastName;
    private String email;
    private String password;

    //static factory method to create a User without an ID, using stream
    public static User of(String firstName, String lastName, String email, String password){
        return new User(null, firstName, lastName, email, password);
    }

    @PersistenceCreator//constructor used by Spring Data JDBC to create objects from database rows
    private User(Long id, String firstName, String lastName, String email, String password){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }
}