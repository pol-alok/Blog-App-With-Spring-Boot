package com.alok.blogappwithboot.controllers.rest;

import com.alok.blogappwithboot.resources.dao.CategoryService;
import com.alok.blogappwithboot.resources.dao.PostService;
import com.alok.blogappwithboot.resources.models.Category;
import com.alok.blogappwithboot.resources.models.Posts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/rest/posts")
public class RestPostController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PostService postService;

    @GetMapping
    public List<Posts> searchingSortingFiltering(@RequestParam(required = false, name = "text") String text,
                                                 @RequestParam(defaultValue = "pid", required = false, name = "sortBy") String sortBy,
                                                 @RequestParam(required = false, name = "category") String category,
                                                 @RequestParam(defaultValue = "0", required = false, name = "page") Integer page,
                                                 @RequestParam(defaultValue = "5", required = false, name = "pageSize") Integer pageSize) {

        if (text != null) {

            if (category != null) {

//                getting the category object by given category;
                Category cat = categoryService.get(category);

//                getting the list related to that category
                List<Posts> listByCategory = cat.getPosts();

//                creating the pageable object
                Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());

//                getting the list of post by search
                List<Posts> listBySearch = postService.getResultBySearch(text, pageable);


//                creating a list to store intersection of both
                List<Posts> listByCategoryAndSearch = new ArrayList<>();

                listBySearch.forEach((i) -> {
                    if (listByCategory.contains(i)) {
                        listByCategoryAndSearch.add(i);
                    }
                });

                return listByCategoryAndSearch;
            } else {
                Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());
                List<Posts> listOfPosts = postService.getResultBySearch(text, pageable);
                return listOfPosts;
            }
        } else {
            if (category != null) {
//                getting category object from name
                Category cat = categoryService.get(category);

//                getting the list of posts from category object
                List<Posts> listByCategory = cat.getPosts();

//                creating pageable object to make page pageable
                Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());

//                getting the list of posts from from post which is pageable
                List<Posts> postsList = postService.listAll(pageable);

                List<Posts> finalList = new ArrayList<>();

                postsList.forEach((i) -> {
                    if (listByCategory.contains(i)) {
                        finalList.add(i);
                    }
                });
                return finalList;
            } else {
                Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());
                return postService.listAll(pageable);
            }

        }
    }

    @GetMapping("/{id}")
    public Posts getPosts(@PathVariable Integer id) {
        return postService.get(id);
    }

    @PostMapping
    public String newPostForm(
            @RequestParam(required = true, name = "title") String title,
            @RequestParam(required = true, name = "content") String content,
            @RequestParam(defaultValue = "Random", required = false, name = "category") String category) {

        List<Category> listOfCategory = new ArrayList<>();
        Arrays.asList(category.split(",")).forEach((categoryName)-> {
            Category cat = categoryService.get(categoryName);
            listOfCategory.add(cat);
        });
        listOfCategory.forEach((i)-> System.out.println(i.getCName()+" "+i.getCid()));
        System.out.println(title);
        System.out.println(content);


        Posts post = new Posts();
        post.setTitle(title);
        post.setContent(content);
        post.setCategories(listOfCategory);
        postService.save(post);
        return "Successfully inserted";
    }

    @PutMapping("/put")
    public String putPosts(@RequestParam(required = true, name = "id") Integer id,
                           @RequestParam(required = true, name = "title") String title,
                           @RequestParam(required = true, name = "content") String content,
                           @RequestParam(defaultValue = "Random", required = false, name = "category") String category) {

        List<Category> newCategoryList = new ArrayList<>();

        Arrays.asList(category.split(",")).forEach((categoryName)-> {
            Category cat = categoryService.get(categoryName);
            newCategoryList.add(cat);
        });
        newCategoryList.forEach((i)-> System.out.println(i.getCName()+" "+i.getCid()));
        System.out.println(title);
        System.out.println(content);

        Posts post = postService.get(id);
        post.setTitle(title);
        post.setContent(content);
        post.setCategories(newCategoryList);
        postService.save(post);

        return "Your post updated successfully";
    }

    @DeleteMapping("delete")
    public String deletePosts(
            @RequestParam(required = true, name = "id") Integer id
    ) {
        postService.delete(id);

        return "deleted successfully";
    }
}
