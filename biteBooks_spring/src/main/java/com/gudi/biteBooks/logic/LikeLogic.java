package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.LikeDao;

@Service
public class LikeLogic {
    Logger logger = LoggerFactory.getLogger(LikeLogic.class);
    @Autowired
    private LikeDao likeDao = null;
    
    //insert method here 

}
