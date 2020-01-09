package com.alok.blogappwithboot.repository;

import com.alok.blogappwithboot.dao.Author;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

    Author findByAid(Integer id);
    Author findByEmail(String email);
    Author findByName(String name);

}
