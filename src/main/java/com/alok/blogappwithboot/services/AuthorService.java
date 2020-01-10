package com.alok.blogappwithboot.services;

import com.alok.blogappwithboot.dao.Author;
import com.alok.blogappwithboot.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class AuthorService {

    @Autowired
    AuthorRepository repo;

    public void save(Author author) {
        repo.save(author);
    }

    public Author findAuthorByName(String name) {
        return repo.findByName(name);
    }
}
