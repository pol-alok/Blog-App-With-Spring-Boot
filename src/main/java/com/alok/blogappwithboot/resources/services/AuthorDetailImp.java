package com.alok.blogappwithboot.resources.services;

import com.alok.blogappwithboot.resources.models.Author;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class AuthorDetailImp implements UserDetails {

    String ROLE_PREFIX = "ROLE_";
    private String authorName;
    private String password;
    private String role;

    public AuthorDetailImp(String authorName,String password, String role) {
        this.authorName = authorName;
        this.password = password;
        this.role = role;
    }

//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return Collections.singleton(new SimpleGrantedAuthority("USER"));
//    }
@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
    List<GrantedAuthority> list = new ArrayList<>();
    list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role));
    return list;
}

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.authorName;
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
        return true;
    }
}
