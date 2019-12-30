package com.alok.blogappwithboot.resources.services;

import com.alok.blogappwithboot.resources.dao.CategoryService;
import com.alok.blogappwithboot.resources.dao.PostService;
import com.alok.blogappwithboot.resources.models.Category;
import com.alok.blogappwithboot.resources.models.Posts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/home/page/{pageNo}")
    public String getHomePage(Model model, @PathVariable String pageNo) {
        Pageable pageable = PageRequest.of(Integer.parseInt(pageNo),5);
        model.addAttribute("lstOfPosts",postService.getListOrderById(pageable));
        model.addAttribute("lastPage",(postService.listAll().size())/5);
        model.addAttribute("pageNo",pageNo);


        model.addAttribute("lstOfCategory",categoryService.listAll());

        System.out.println();
        return "index";
    }

    @GetMapping("/create-post")
    public String newPostForm(Model model) {
        Posts post = new Posts();
        Map<Category,String> mpOfCategory = new HashMap<>();
        categoryService.listAll().forEach((category)-> mpOfCategory.put(category,category.getCName()));
        model.addAttribute("mpOfCategory",mpOfCategory);
        model.addAttribute("post", post);
        return "createPost";
    }

    @PostMapping("/create-post")
    public String createPost(@ModelAttribute("post") Posts post, Model model) {

        post.getCategories().forEach((i)-> System.out.println(i.getCName()));
        postService.save(post);

        model.addAttribute("create", "Your Post created successfully!");
        return "postConformation";
    }


    @GetMapping("/update-post/{id}")
    public String editPostForm(@PathVariable("id") Integer id, Model model) {
        Posts post = postService.get(id);

        Map<Category,String> mpOfCategory = new HashMap<>();
        categoryService.listAll().forEach((category)-> mpOfCategory.put(category,category.getCName()));
        model.addAttribute("mpOfCategory",mpOfCategory);
        model.addAttribute("singlePost", post);
        return "updatePost";
    }

    @PostMapping("/update-post")
    public String saveEditedForm(@ModelAttribute("singlePost") Posts post, Model model) {
        postService.save(post);
        model.addAttribute("update","Your Post Updated successfully!");
        return "postConformation";
    }

    @GetMapping("/delete-post/{id}")
    public String deletePostConformation(@PathVariable("id") Integer id) {
        return "deletePostConformation";
    }


    @PostMapping("/delete-post/{id}")
    public String deleteCustomerForm(Model model, @PathVariable("id") Integer pid) {
        postService.delete(pid);
//        return "redirect:/";

        model.addAttribute("delete","Your Post Deleted successfully!");
        return "postConformation";
    }

    @GetMapping("/create-category")
    public String createNewCategory(Model model) {
        Category category = new Category();
        model.addAttribute("category",category);
        return "createCategory";
    }

    @PostMapping("/create-category")
    public String saveCategory(@ModelAttribute("category") Category category) {


        System.out.println(category.getCName());
        categoryService.save(category);

        return "postConformation";
    }
    @GetMapping("/home/page/order-by-update/{pageNo}")
    public String sortByUpdatedDate(Model model, @PathVariable String pageNo) {
        Pageable pageable = PageRequest.of(Integer.parseInt(pageNo),5);
        model.addAttribute("lstOfPosts",postService.getPostOrderByUpdate(pageable));
        model.addAttribute("lastPage",(postService.listAll().size())/5);
        model.addAttribute("pageNo",pageNo);
        return "index";
    }

    @GetMapping("/home/page/order-by-title/{pageNo}")
    public String sortByTitle(Model model, @PathVariable String pageNo) {
        Pageable pageable = PageRequest.of(Integer.parseInt(pageNo),5);
        model.addAttribute("lstOfPosts",postService.getOrderByTitle(pageable));
        model.addAttribute("lastPage",(postService.listAll().size())/5);
        model.addAttribute("pageNo",pageNo);
        return "index";
    }

    @GetMapping("/home/page/order-by-create/{pageNo}")
    public String sortByCreatedDate(Model model, @PathVariable String pageNo) {
        Pageable pageable = PageRequest.of(Integer.parseInt(pageNo),5);
        model.addAttribute("lstOfPosts",postService.getPostOrderByCreate(pageable));
        model.addAttribute("lastPage",(postService.listAll().size())/5);
        model.addAttribute("pageNo",pageNo);
        return "index";
    }

    @GetMapping("/posts/find-by-{categoryName}/{cid}/{pageNo}")
    public String findByCategory(Model model, @PathVariable String categoryName, @PathVariable String cid, @PathVariable String pageNo) {
        Category category = categoryService.get(Integer.parseInt(cid));
        model.addAttribute("lstOfPosts",category.getPosts());
        return "index";
    }

    @GetMapping("/search")
    public String searchPost(@RequestParam("text") String text,Model model) {
        model.addAttribute("lstOfPosts",postService.getResultBySearch(text));

        return "index";
    }

//    @GetMapping("/post")
//    public String searchingSortingFiltering(@RequestParam(required = false,name = "text") String text,
//                                            @RequestParam(defaultValue = "pid",required = false,name = "sortBy") String sortBy,
//                                            @RequestParam(required = false,name = "category") String category,
//                                            @RequestParam(defaultValue = "0",required = false,name = "page") Integer page,
//                                            @RequestParam(defaultValue = "5",required = false,name = "pageSize") Integer pageSize,
//                                            Model model) {
//
//        if(text!=null)
//        {
//            System.out.println("hjsdgfbhiosudbfgdhiufbg");
//            Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());
//            model.addAttribute("lstOfPosts",postService.getResultBySearch(text,pageable));
//            model.addAttribute("lastPage",(postService.getResultBySearch(text,pageable).size())/5);
//            model.addAttribute("pageNo",page);
//            return "index";
//        }
//        else {
//            Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy).ascending());
//            model.addAttribute("lstOfPosts",postService.listAll(pageable));
//            model.addAttribute("lastPage",(postService.listAll(pageable).size())/5);
//            model.addAttribute("pageNo",page);
//            return "index";
//        }
//
//    }
}
