package com.alok.blogappwithboot.services;

public class dummy {
    //        List<Posts> listOfPost;
//        if (author != null) {
//
//            Author auth = authorService.findAuthorByName(author);
//            listOfPost = postService.getResultByAuthor(auth, pageable);
//        } else {
//            if (keyword != null) {
//                if (category != null) {
//
//                    Category cat;
//                    try {
//                        cat = categoryService.get(category);
//
//                    } catch (Exception e) {
//                        LOGGER.warn("getting exception in getting object by given list of category");
//                        return "error";
//                    }
//                    List<Posts> postByCat = cat.getPosts();
//                    listOfPost= postService.getResultBySearch(keyword, pageable).stream()
//                            .filter(postByCat::contains)
//                            .collect(Collectors.toList());
//                } else {
//                    listOfPost = postService.getResultBySearch(keyword, pageable);
//                }
//
//            } else {
//                if (category != null) {
//                    Category cat;
//                    try {
//                        cat = categoryService.get(category);
//
//                    } catch (Exception e) {
//                        LOGGER.warn("getting exception in getting object by given list of category");
//                        return "error";
//                    }
//                    List<Posts> postByCat = cat.getPosts();
//                    listOfPost= postService.listAll(pageable).stream()
//                            .filter(postByCat::contains)
//                            .collect(Collectors.toList());
//                } else {
//                    try {
//                        listOfPost = postService.listAll(pageable);
//                    } catch (Exception e) {
//                        LOGGER.warn("getting exception in getting list of posts");
//                        return "error";
//                    }
//                }
//
//            }
//
//        }
}
