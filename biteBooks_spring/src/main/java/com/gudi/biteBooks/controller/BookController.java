package com.gudi.biteBooks.controller;

import com.google.gson.Gson;
import lombok.Getter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.gudi.biteBooks.logic.BookLogic;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/book/*")
public class BookController {
    Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookLogic bookLogic = null;


    //읽기
    @GetMapping("bookList")
    public String bookList(@RequestParam Map<String, Object> pMap) {
        logger.info(pMap.toString());// n_title, 시험
        List<Map<String, Object>> bList = null;
        bList = bookLogic.bookList(pMap);

        String temp = null;
        Gson g = new Gson();
        temp = g.toJson(bList);
        return temp;
    }

    //입력
    @PostMapping("/bookInsert")
    public String bookInsert(@RequestParam Map<String, Object> pMap) {
        int result = bookLogic.bookInsert(pMap);
        return String.valueOf(result);
    }


    //삭제
    @DeleteMapping("/bookDelete")
    public String bookDelete(@RequestParam Map<String, Object> pMap) {
        int result = bookLogic.bookDelete(pMap);
        return String.valueOf(result);
    }

    //업데이트
    @PutMapping("/bookUpdate")
    public String bookUpdate(@RequestParam Map<String, Object> pMap){
        int result = bookLogic.bookUpdate(pMap);
        return String.valueOf(result);
    }


}
