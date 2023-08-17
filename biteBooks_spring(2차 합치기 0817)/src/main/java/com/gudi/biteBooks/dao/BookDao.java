package com.gudi.biteBooks.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.security.PublicKey;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Repository
public class BookDao {
    Logger logger = LoggerFactory.getLogger(BookDao.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;


    public List<Map<String, Object>> fetchBookList(){
        return sqlSessionTemplate.selectList("bookList");
    }

    public Map<String, Object> fetchBookDetail(int bookId){
        return sqlSessionTemplate.selectOne("bookDetail", bookId);
    }

    public List<Map<String, Object>> fetchBookByKeyword(String keyword){
        return sqlSessionTemplate.selectList("searchBooks", keyword);
    }

}
