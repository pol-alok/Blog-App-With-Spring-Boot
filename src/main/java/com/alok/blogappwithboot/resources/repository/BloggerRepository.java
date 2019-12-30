package com.alok.blogappwithboot.resources.repository;

import com.alok.blogappwithboot.resources.models.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BloggerRepository extends JpaRepository<Author, Integer> {

        }
