package com.alok.blogappwithboot.validator;


import com.alok.blogappwithboot.dao.Author;
import com.alok.blogappwithboot.services.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
@Component
public class AuthorNameValidator implements Validator {

    @Autowired
    AuthorService authorService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Author.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Author author = (Author) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name","NotEmpty");

        if(author.getName().length()< 4 || author.getName().length() >20) {
            errors.rejectValue("name","UserNameLengthValidation");
        }
        if(authorService.findAuthorByName(author.getName())!=null) {
            errors.rejectValue("name","UserNameUniqueValidation");
        }

    }
}
