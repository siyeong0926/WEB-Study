package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.NoticeDao;

@Service
public class NoticeLogic {
    Logger logger = LoggerFactory.getLogger(NoticeLogic.class);
    @Autowired
    private NoticeDao noticeDao = null;
    
    //insert method here 

}
