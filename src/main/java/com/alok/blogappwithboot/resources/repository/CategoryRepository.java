package com.alok.blogappwithboot.resources.repository;
import com.alok.blogappwithboot.resources.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Category findByCid(Integer id);

}