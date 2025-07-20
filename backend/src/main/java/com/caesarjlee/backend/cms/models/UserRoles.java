package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

@Setter
@Getter
@ToString
@Table("user_roles")
public class UserRoles{
    @JsonProperty("user_id")
    private Long userId;
    @JsonProperty("role_id")
    private Long roleId;

    @PersistenceCreator
    private UserRoles(
        Long userId,
        Long roleId
    ){
        this.userId = userId;
        this.roleId = roleId;
    }

    public UserRoles of(
            Long userId,
            Long roleId
    ){
        return new UserRoles(
            userId,
            roleId
        );
    }
}