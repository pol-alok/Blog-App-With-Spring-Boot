package com.alok.blogappwithboot.resources.models;

import lombok.Getter;
import lombok.Setter;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Getter
@Setter
public class Posts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pid;

    private String title;

    private String content;

    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date published;

    @UpdateTimestamp
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Column(nullable = false)
    private Date updatedAt;

    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date createdAt;

    @ManyToOne
    private Author author;

    @ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Category> categories = new ArrayList<>();
}
