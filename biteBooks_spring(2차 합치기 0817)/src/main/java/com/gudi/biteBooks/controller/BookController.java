package com.gudi.biteBooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.biteBooks.logic.BookLogic;

@Controller
@RequestMapping("/book/*")
public class BookController {
    Logger logger = LoggerFactory.getLogger(BookController.class);
    @Autowired
    private BookLogic bookLogic = null;

    //insert method here
    @GetMapping("main")
    public String bookList() {
        return "book/main";
    }

    @GetMapping("detail")
    public String bookDetail(){
        return "book/detail";
    }
    @GetMapping("search")
    public String bookSearch(){
        return "book/search";
    }
}
