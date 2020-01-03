package com.alok.blogappwithboot.resources.services;

import com.alok.blogappwithboot.resources.models.Author;
import com.alok.blogappwithboot.resources.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthorDetailService implements UserDetailsService {
    @Autowired
    private AuthorRepository authorRepository;
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Author author = authorRepository.findByName(s);
        if(author==null) {
            throw  new UsernameNotFoundException("Author 404!");
        }
        return new AuthorDetailImp(author.getName(),author.getPassword(),author.getRole());
    }
}
