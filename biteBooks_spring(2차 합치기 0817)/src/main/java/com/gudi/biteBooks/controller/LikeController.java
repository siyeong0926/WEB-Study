package com.gudi.biteBooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.biteBooks.logic.LikeLogic;

@Controller
@RequestMapping("/like/*")
public class LikeController {
    Logger logger = LoggerFactory.getLogger(LikeController.class);
    @Autowired
    private LikeLogic likeLogic = null;
            
    //insert method here 

}
