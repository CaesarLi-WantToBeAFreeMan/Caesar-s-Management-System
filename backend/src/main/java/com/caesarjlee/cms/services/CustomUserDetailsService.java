package com.caesarjlee.cms.services;

import com.caesarjlee.cms.models.User;
import com.caesarjlee.cms.repositories.UserRepository;
import com.caesarjlee.cms.securities.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException{
        User user = userRepository  .findByUsernameOrEmailOrPhone(login)
                                    .orElseThrow(
                                        () -> new UsernameNotFoundException(login + " not found")
                                    );
        return new CustomUserDetails(user);
    }
}