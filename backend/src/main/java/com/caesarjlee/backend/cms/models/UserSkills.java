package com.caesarjlee.backend.cms.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.PersistenceCreator;
import org.springframework.data.relational.core.mapping.Table;

@Setter
@Getter
@ToString
@Table("user_skills")
public class UserSkills{
    @JsonProperty("user_id")
    @NotNull
    private Long userId;
    @JsonProperty("skill_id")
    @NotNull
    private Long skillId;

    @PersistenceCreator
    private UserSkills(
        Long userId,
        Long skillId
    ){
        this.userId = userId;
        this.skillId = skillId;
    }

    public UserSkills of(
        Long userId,
        Long skillId
    ){
        return new UserSkills(
            userId,
            skillId
        );
    }
}