package com.alok.blogappwithboot.dao;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity
public class Author {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer aid;
    private String name;
    private String email;
    private String password;
    private String role;
    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date createdAt;

    @UpdateTimestamp
    @Column(nullable = false,updatable = false)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date updatedAt;

    @OneToMany(mappedBy = "author")
    private List<Posts> posts = new ArrayList<>();

}
