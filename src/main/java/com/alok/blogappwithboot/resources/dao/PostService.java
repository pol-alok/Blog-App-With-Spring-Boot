package com.alok.blogappwithboot.resources.dao;



import com.alok.blogappwithboot.resources.models.Category;
import com.alok.blogappwithboot.resources.models.Posts;
import com.alok.blogappwithboot.resources.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PostService {
    @Autowired
    PostRepository repo;



    public void save(Posts post) {
        repo.save(post);
    }

    public List<Posts> getListOrderById(Pageable page) {
        return repo.findAllByOrderByPidAsc(page).getContent();
    }

    public List<Posts> listAll(Pageable page) {
        return repo.findAll(page).getContent();
    }

    public Posts get(Integer id) {
        return repo.findByPid(id);
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }

    public List<Posts> getOrderByTitle(Pageable page) {
        return repo.findAllByOrderByTitleAsc(page).getContent();
    }

    public List<Posts> getPostOrderByUpdate(Pageable page){
        return repo.findAllByOrderByUpdatedAtDesc(page).getContent();
    }

    public List<Posts> getPostOrderByCreate(Pageable page) {
        return repo.findAllByOrderByCreatedAtDesc(page).getContent();
    }

    public  List<Posts> getResultBySearch(String text,Pageable pageable) {
        return repo.findAllByContentContainsOrTitleContains(text,text,pageable);
    }


}
