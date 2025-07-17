package com.caesarjlee.backend.cms.dataTransmitObjects;

import com.fasterxml.jackson.annotation.JsonProperty;

public record TestUserResponse(
        Long id,
        @JsonProperty("first_name")
        String firstName,
        @JsonProperty("last_name")
        String lastName,
        String email,
        String password
){}
