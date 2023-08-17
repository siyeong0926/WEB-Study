package com.gudi.biteBooks.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gudi.biteBooks.logic.CartLogic;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/cart/*")
public class CartController {

    @Autowired
    private CartLogic cartLogic = null;

    //insert method here
    @GetMapping("cartList")
    public String cartList(@RequestParam Map<String, Object> pMap, Model model){
        log.info("장바구니 목록 조회 요청");
        List<Map<String,Object>> cList = null;
        cList = cartLogic.cartList(pMap);
        model.addAttribute("cList", cList);
        return "payment/cart";

    }

}
