package com.gudi.biteBooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.biteBooks.logic.QnaLogic;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
    Logger logger = LoggerFactory.getLogger(QnaController.class);
    @Autowired
    private QnaLogic qnaLogic = null;
            
    //insert method here 

}
