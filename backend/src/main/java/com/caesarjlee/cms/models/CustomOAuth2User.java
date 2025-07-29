package com.caesarjlee.cms.models;

import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2User extends DefaultOAuth2User{
    private User user;

    public CustomOAuth2User(OAuth2User oAuth2User, User user){
        super(oAuth2User.getAuthorities(), oAuth2User.getAttributes(), "name");
        this.user = user;
    }

    public User getUser(){
        return this.user;
    }

    public Integer getDepartmentId(){
        return user.getDepartmentId();
    }

    public Integer getTeamId(){
        return user.getTeamId();
    }
}