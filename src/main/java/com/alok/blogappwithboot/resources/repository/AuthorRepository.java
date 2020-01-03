package com.alok.blogappwithboot.resources.repository;

import com.alok.blogappwithboot.resources.models.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

    Author findByAid(Integer id);
    Author findByEmail(String email);
    Author findByName(String name);

}
