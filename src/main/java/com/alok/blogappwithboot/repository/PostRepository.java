package com.alok.blogappwithboot.repository;

import com.alok.blogappwithboot.dao.Author;
import com.alok.blogappwithboot.dao.Category;
import com.alok.blogappwithboot.dao.Posts;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;


import java.util.List;


public interface PostRepository extends JpaRepository<Posts, Integer>, PagingAndSortingRepository<Posts, Integer> {

    Page<Posts> findAllByOrderByPidAsc(Pageable pageable);

    Page<Posts> findAllByOrderByTitleAsc(Pageable pageable);

    Page<Posts> findAllByOrderByUpdatedAtDesc(Pageable pageable);

    Page<Posts> findAllByOrderByCreatedAtDesc(Pageable pageable);

    List<Posts> findAllByContentContainsOrTitleContains(String content,String title,Pageable pageable);

    Posts findByPid(Integer id);

    Page<Posts> findAllByAuthor(Author name, Pageable pageable);

}
