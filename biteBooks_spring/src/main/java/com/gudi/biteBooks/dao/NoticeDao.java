package com.gudi.biteBooks.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
    Logger logger = LoggerFactory.getLogger(NoticeDao.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;
        
    //insert method here 

}
