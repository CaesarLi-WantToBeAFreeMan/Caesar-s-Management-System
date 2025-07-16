package com.caesarjlee.backend.cms.models;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

@Setter//generate setters for all fields
@Getter//generate getters for all fields
@ToString//generate toString() method
@Table("CMS_USERS")
public class User{
    @Id//mark this field is the unique identifier, PRIMARY KEY
    private Long id;
    private String firstName;//JDBC will convert all capital letter as _lowercase, e.g. first_name
    private String lastName;
    private String email;
    private String password;

    //static factory method, stream
    public static User of(String firstName, String lastName, String email, String password){
        return new User(null, firstName, lastName, email, password);
    }

    @PersistenceCreator//spring data uses to reconstructor from database
    private User(Long id, String firstName, String lastName, String email, String password){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }
}