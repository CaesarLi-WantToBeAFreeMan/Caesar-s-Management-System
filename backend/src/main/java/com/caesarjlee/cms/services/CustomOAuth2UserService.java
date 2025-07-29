package com.caesarjlee.cms.services;

import com.caesarjlee.cms.models.CustomOAuth2User;
import com.caesarjlee.cms.models.User;
import com.caesarjlee.cms.repositories.RoleRepository;
import com.caesarjlee.cms.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService{
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException{
        OAuth2User oAuth2User = super.loadUser(oAuth2UserRequest);
        String email = oAuth2User.getAttribute("email");
        User user = userRepository  .findByEmail(email)
                                    .orElseGet(
                                        () -> {
                                            User newUser = new User();
                                            newUser.setUsername(email);
                                            newUser.setPassword("");
                                            newUser.setFirstName(oAuth2User.getAttribute("given_name"));
                                            newUser.setLastName(oAuth2User.getAttribute("family_name"));
                                            newUser.setEmail(email);
                                            newUser.setRole(
                                                roleRepository  .findByName("EMPLOYEE")
                                                                .orElseThrow(
                                                                    () -> new IllegalStateException(
                                                                            "Role EMPLOYEE not found"
                                                                    )
                                                                )
                                            );
                                            newUser.setStatus(true);
                                            return userRepository.save(newUser);
                                        }
                                    );
        return new CustomOAuth2User(oAuth2User, user);
    }
}