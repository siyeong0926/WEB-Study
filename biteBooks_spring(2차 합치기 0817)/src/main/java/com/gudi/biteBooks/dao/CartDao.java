package com.gudi.biteBooks.dao;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Slf4j
@Repository
public class CartDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    //insert method here
    public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
        log.info("장바구니-다오");
        List<Map<String, Object>> cList = null;
        cList = sqlSessionTemplate.selectList("cartList", pMap);
        return cList;
    }



}
