package com.alok.blogappwithboot.controllers;


import com.alok.blogappwithboot.dao.Author;
import com.alok.blogappwithboot.dao.Category;
import com.alok.blogappwithboot.dao.Posts;
import com.alok.blogappwithboot.services.AuthorService;
import com.alok.blogappwithboot.services.CategoryService;
import com.alok.blogappwithboot.services.PostService;
import com.alok.blogappwithboot.validator.AuthorNameValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class PostController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PostController.class);
    @Autowired
    private PostService postService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AuthorNameValidator authorNameValidator;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/")
    public String home(@RequestParam(required = false, name = "keyword") String keyword,
                       @RequestParam(required = false, name = "author") String author,
                       @RequestParam(defaultValue = "pid", required = false, name = "sortBy") String sortBy,
                       @RequestParam(required = false, name = "category") String category,
                       @RequestParam(defaultValue = "0", required = false, name = "page") Integer page,
                       @RequestParam(defaultValue = "3", required = false, name = "pageSize") Integer pageSize,
                       Model model) {
        List<Posts> listOfPost;
        try {
            listOfPost= postService.searchingSortingFiltering(keyword,author,sortBy,category,page,pageSize);
        } catch (Exception e) {

            LOGGER.warn("getting exception in database operation");
            return "error";
        }
        model.addAttribute("lstOfPosts", listOfPost);
        model.addAttribute("lastPage", listOfPost.size());
        model.addAttribute("pageNo", page);
        model.addAttribute("lstOfCategory", categoryService.listAll());
        model.addAttribute("error","Requesting for the page which is not exist");
        if(page>listOfPost.size()) {
            return "error";
        }
        else {
            return "home";
        }
    }

    @GetMapping("/create-post")
    public String newPostForm(Model model) {
        LOGGER.info("in new Post creation");
        Posts post = new Posts();
        Map<Category, String> mpOfCategory = new HashMap<>();
        LOGGER.info("creating a category list");
        categoryService.listAll().forEach((category) -> mpOfCategory.put(category, category.getCName()));
        model.addAttribute("mpOfCategory", mpOfCategory);
        model.addAttribute("post", post);
        LOGGER.info("Done with create Post");
        return "createPost";
    }


    @PostMapping("/create-post")
    public String createPost(@ModelAttribute("post") Posts post, Model model) {
        try {
            postService.savePost(post);
        }catch (Exception e) {
            LOGGER.warn("getting exception in saving the post");
            return "error";
        }
        model.addAttribute("create", "Your Post created successfully!");
        model.addAttribute("thisPost",post);
        return "postConformation";
    }

    @GetMapping("/post/{id}")
    public String getSinglePage(@PathVariable Integer id, Model model) {
        Posts post = postService.get(id);
        model.addAttribute("post", post);
        return "fullPageView";
    }

    @GetMapping("/login")
    public String getLoginPage(Principal principal) {
        if (principal != null) {
            return "redirect:/posts";
        } else {
            return "login";
        }
    }

    @GetMapping("/signUp")
    public String newAuthorForm(Model model) {
        Author author = new Author();
        model.addAttribute("author", author);
        return "signUpForm";
    }

    @PostMapping("/signUp")
    public String saveUser(@ModelAttribute("author") Author author, Model model, BindingResult bindingResult) {
        authorNameValidator.validate(author, bindingResult);
        if (bindingResult.hasErrors()) {
            return "signUpForm";
        }
        try {
            postService.saveSingleAuthor(author);
        } catch (Exception e) {
            LOGGER.warn("exception in saving author");
            return "error";
        }
        model.addAttribute("signUp", "Sign Up successfully!");
        return "postConformation";
    }

    @GetMapping("/update-post/{id}")
    public String editPostForm(@PathVariable("id") Integer id, Model model, Principal principal, SecurityContextHolderAwareRequestWrapper requestWrapper) {
        LOGGER.info("getting current user form principle");
        String name = principal.getName();
        LOGGER.info("getting post by id");
        Posts currentPost;
        try {
            currentPost = postService.get(id);
        } catch (Exception e) {
            LOGGER.warn("getting exception to find post by id");
            return "error";
        }
        String postAuthorName = currentPost.getAuthor().getName();
        if (postAuthorName.equals(name) || requestWrapper.isUserInRole("ROLE_ADMIN")) {
            Posts post;
            try {
                post = postService.get(id);
            } catch (Exception e) {
                LOGGER.warn("getting exception to find post by id");
                return "error";
            }
            Map<Category, String> mpOfCategory = new HashMap<>();
            categoryService.listAll().forEach((category) -> mpOfCategory.put(category, category.getCName()));
            model.addAttribute("mpOfCategory", mpOfCategory);
            model.addAttribute("singlePost", post);
            return "updatePost";
        } else {
            return "redirect:/posts";
        }
    }

    @PostMapping("/update-post")
    public String saveEditedForm(@ModelAttribute("singlePost") Posts post, Model model) {
        LOGGER.info("saving post");
        try {
            postService.save(post);
        } catch (Exception e) {
            LOGGER.warn("exception in saving post");
            return "error";
        }
        model.addAttribute("update", "Your Post Updated successfully!");
        model.addAttribute("thisPost",post);
        return "postConformation";
    }

    @GetMapping("/delete-post/{id}")
    public String deletePostConformation(@PathVariable("id") Integer id, Principal principal, SecurityContextHolderAwareRequestWrapper requestWrapper) {
        String name = principal.getName();
        Posts currentPost;
        try {
            currentPost = postService.get(id);
        } catch (Exception e) {
            LOGGER.warn("getting exception in getting post by id");
            return "error";
        }
        String postAuthorName = currentPost.getAuthor().getName();
        if (postAuthorName.equals(name) || requestWrapper.isUserInRole("ROLE_ADMIN")) {
            return "deletePostConformation";
        } else {
            return "redirect:/posts";
        }
    }

    @PostMapping("/delete-post/{id}")
    public String deleteCustomerForm(Model model, @PathVariable("id") Integer pid) {
        LOGGER.info("deleting post");
        try {
            postService.delete(pid);
        } catch (Exception e) {
            LOGGER.warn(" exception in deleting post");
            return "error";
        }
        LOGGER.info("deleted successfully");
        model.addAttribute("delete", "Your Post Deleted successfully!");
        return "postConformation";
    }

    @GetMapping("/create-category")
    public String createNewCategory(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "createCategory";
    }

    @PostMapping("/create-category")
    public String saveCategory(@ModelAttribute("category") Category category) {
        LOGGER.info("saving category");
        try {
            categoryService.save(category);
        } catch (Exception e) {
            LOGGER.warn("exception in saving category");
            return "error";
        }
        LOGGER.info("saved successfully");
        return "postConformation";
    }
}