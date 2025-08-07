package com.caesarjlee.cms.services;

import com.caesarjlee.cms.models.User;
import com.caesarjlee.cms.repositories.RoleRepository;
import com.caesarjlee.cms.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException{
        User user = userRepository  .findByUsernameOrEmailOrPhone(login)
                                    .orElseThrow(() -> new UsernameNotFoundException(login + " not found"));
        String roleName = roleRepository    .findById(user.getRoleId())
                                            .map(role -> "ROLE_" + role.getName().toUpperCase())
                                            .orElse("ROLE_EMPLOYEE");
        return new org.springframework.security.core.userdetails.User(
            user.getUsername(),
            user.getPassword(),
            Collections.singletonList(new SimpleGrantedAuthority(roleName))
        );
    }
}