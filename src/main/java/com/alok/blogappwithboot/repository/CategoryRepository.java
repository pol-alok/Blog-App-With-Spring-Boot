package com.alok.blogappwithboot.repository;
import com.alok.blogappwithboot.dao.Category;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Category findBycName(String name);
}