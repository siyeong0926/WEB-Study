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

    public List<Map<String, Object>> bookList(Map<String, Object> pMap) {

            logger.info(pMap.toString());// gubun=n_title, n_writer, n_content, keyword=사용자가 입력한 값
            // 널로 초기화 했더라도 myBatis를 연계하면 객체생성 해줌
            List<Map<String, Object>> bList = null;// myBatis연동시 디폴트 생성자 호출됨
            bList = bookDao.bookList(pMap);
            return bList;
        }

    public int bookDelete(Map<String, Object> pMap) {
        return bookDao.bookDelete(pMap);
    }

    public int bookInsert(Map<String, Object> pMap) {
        return 0;
    }

    public int bookUpdate(Map<String, Object> pMap) {
        return 0;
    }
}

    //insert method here


