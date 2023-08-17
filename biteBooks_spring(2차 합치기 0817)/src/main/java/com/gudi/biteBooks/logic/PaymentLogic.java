package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.PaymentDao;

@Service
public class PaymentLogic {
    Logger logger = LoggerFactory.getLogger(PaymentLogic.class);
    @Autowired
    private PaymentDao paymentDao = null;
    
    //insert method here 

}
