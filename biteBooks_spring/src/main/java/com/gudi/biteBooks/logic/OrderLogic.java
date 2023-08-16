package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.OrderDao;

@Service
public class OrderLogic {
    Logger logger = LoggerFactory.getLogger(OrderLogic.class);
    @Autowired
    private OrderDao orderDao = null;
    
    //insert method here 


}
