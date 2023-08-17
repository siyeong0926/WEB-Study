package com.gudi.biteBooks.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.BookDao;

import java.util.List;
import java.util.Map;

@Service
public class BookLogic {
    Logger logger = LoggerFactory.getLogger(BookLogic.class);

    @Autowired
    private BookDao bookDao = null;
    

    // 책 목록 조회
    public List<Map<String, Object>> getBookList(){
        return bookDao.fetchBookList();
    }

    // 책 상세 조회
    public Map<String, Object> getBookDetail(int bookId){
        return bookDao.fetchBookDetail(bookId);
    }

    // 책 검색
    public List<Map<String, Object>> searchBooks(String keyword){
        return bookDao.fetchBookByKeyword(keyword);
    }
}
