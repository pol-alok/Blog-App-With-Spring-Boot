package com.alok.blogappwithboot.resources.dao;

import com.alok.blogappwithboot.resources.models.Author;
import com.alok.blogappwithboot.resources.repository.AuthorRepository;
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

    public List<Author> listAll() {
        return repo.findAll();
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }

    public Author findAuthorById(Integer id) {
        return repo.findByAid(id);
    }

    public Author findAuthorByName(String name) {
        return repo.findByName(name);
    }
}
