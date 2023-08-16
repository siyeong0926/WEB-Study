package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.CartDao;

@Service
public class CartLogic {
    Logger logger = LoggerFactory.getLogger(CartLogic.class);
    @Autowired
    private CartDao cartDao = null;
    
    //insert method here 

}
