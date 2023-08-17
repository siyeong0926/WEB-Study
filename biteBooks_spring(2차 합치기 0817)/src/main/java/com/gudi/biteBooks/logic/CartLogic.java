package com.gudi.biteBooks.logic;

import com.gudi.biteBooks.controller.CartController;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.CartDao;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class CartLogic {

    @Autowired
    private CartDao cartDao = null;

    public List<Map<String, Object>> cartList(Map<String, Object> pMap) {
        log.info("장바구니-로직");
        List<Map<String, Object>> cList = null;
        cList = cartDao.cartList(pMap);
        return cList;
    }

    //insert method here 

}
