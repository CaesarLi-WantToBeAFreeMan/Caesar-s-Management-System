package com.caesarjlee.cms.securities;

import com.caesarjlee.cms.models.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Data
@AllArgsConstructor
public class CustomUserDetails implements UserDetails{
    private final User user;

    @Override
    public Collection <? extends GrantedAuthority> getAuthorities(){
        return List.of(
            new SimpleGrantedAuthority(
                "ROLE_" + user  .getRole()
                                    .getName()
                                    .toUpperCase()
            )
        );
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.getStatus();
    }

    public Integer getDepartmentId(){
        return user.getDepartmentId();
    }

    public Integer getTeamId(){
        return user.getTeamId();
    }
}