package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.QnaDao;

@Service
public class QnaLogic {
    Logger logger = LoggerFactory.getLogger(QnaLogic.class);
    @Autowired
    private QnaDao qnaDao = null;
    
    //insert method here 

}
