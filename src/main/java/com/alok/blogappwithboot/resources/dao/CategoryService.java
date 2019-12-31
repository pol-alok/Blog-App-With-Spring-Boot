package com.alok.blogappwithboot.resources.dao;

import com.alok.blogappwithboot.resources.models.Category;
import com.alok.blogappwithboot.resources.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService {

    @Autowired
    CategoryRepository repo;


    public void save(Category category) {
        repo.save(category);
    }

    public List<Category> listAll() {
        return repo.findAll();
    }

    public Category get(String name) {
        return repo.findBycName(name);
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }
}
