package com.alok.blogappwithboot.services;


import com.alok.blogappwithboot.dao.Author;
import com.alok.blogappwithboot.dao.Category;
import com.alok.blogappwithboot.dao.Posts;
import com.alok.blogappwithboot.repository.PostRepository;
import com.alok.blogappwithboot.validator.AuthorNameValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class PostService {

    private static final Logger LOGGER = LoggerFactory.getLogger(PostService.class);

    @Autowired
    PostRepository repo;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AuthorNameValidator authorNameValidator;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public void save(Posts post) {
        repo.save(post);
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

    public List<Posts> getResultBySearch(String text, Pageable pageable) {
        return repo.findAllByContentContainsOrTitleContains(text, text, pageable);
    }

    public List<Posts> getResultByAuthor(Author auth, Pageable page) {
        return repo.findAllByAuthor(auth, page).getContent();
    }

    public List<Posts> searchingSortingFiltering(String keyword, String author, String sortBy, String category, Integer page, Integer pageSize) {
        Pageable pageable;
        if (sortBy.equals("updatedAt") || sortBy.equals("createdAt")) {
            pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).descending());
        } else {
            pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());
        }
        List<Posts> listOfPost;
        if (author != null) {

            Author auth = authorService.findAuthorByName(author);
            listOfPost = repo.findAllByAuthor(auth, pageable).getContent();
        } else {
            if (keyword != null) {
                if (category != null) {

                    Category cat = categoryService.get(category);

                    List<Posts> postByCat = cat.getPosts();
                    listOfPost = repo.findAllByContentContainsOrTitleContains(keyword, keyword, pageable).stream()
                            .filter(postByCat::contains)
                            .collect(Collectors.toList());
                } else {
                    listOfPost = repo.findAllByContentContainsOrTitleContains(keyword, keyword, pageable);
                }

            } else {
                if (category != null) {
                    Category cat = categoryService.get(category);

                    List<Posts> postByCat = cat.getPosts();
                    listOfPost = repo.findAll(pageable).getContent().stream()
                            .filter(postByCat::contains)
                            .collect(Collectors.toList());
                } else {

                    listOfPost = repo.findAll(pageable).getContent();
                }

            }

        }
        return listOfPost;
    }

    public void savePost(Posts post) {
        LOGGER.info("authentication in post request");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        LOGGER.info("finding author by name");
        Author loggedInAuthor;
        loggedInAuthor = authorService.findAuthorByName(name);
        post.setAuthor(loggedInAuthor);
        LOGGER.info("saving post");
        repo.save(post);
    }

    public void saveSingleAuthor(Author author) {
        String encryptedPass = passwordEncoder.encode(author.getPassword());
        author.setPassword(encryptedPass);
        author.setRole("USER");
        LOGGER.info("saving author");
        authorService.save(author);
        LOGGER.warn("exception in saving author");
    }
}
