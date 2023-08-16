package com.gudi.biteBooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gudi.biteBooks.logic.NoticeLogic;


@RestController
@RequestMapping("/notice/*")
public class NoticeController {
    Logger logger = LoggerFactory.getLogger(NoticeController.class);
    @Autowired
    private NoticeLogic noticeLogic = null;
}
