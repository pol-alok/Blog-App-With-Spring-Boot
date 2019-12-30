package com.alok.blogappwithboot.resources.models;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Getter
@Setter
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cid;

    private String cName;

    @CreationTimestamp
    @Column(nullable = false,updatable = false)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date createdAt;

    @UpdateTimestamp
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Column(nullable = false)
    private Date updatedAt;

    @ManyToMany(mappedBy = "categories",fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    private List<Posts> posts = new ArrayList<>();

}
