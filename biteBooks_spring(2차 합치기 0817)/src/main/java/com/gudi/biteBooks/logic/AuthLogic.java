package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.AuthDao;

@Service
public class AuthLogic {
    Logger logger = LoggerFactory.getLogger(AuthLogic.class);
    @Autowired
    private AuthDao authDao = null;
        
    //insert method here 

}
