package com.alok.blogappwithboot.resources.models;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
    private String aName;
    private String aEmail;
    private String aPassword;

    @CreationTimestamp
    private Date createdAt;
    @UpdateTimestamp
    private Date updatedAt;

    @OneToMany(mappedBy = "author")
    private List<Posts> posts = new ArrayList<>();

}
