package com.gudi.biteBooks.controller;

import com.gudi.biteBooks.logic.OrderLogic;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/order/*")
public class OrderController {

    @Autowired(required = false)
    private OrderLogic orderLogic = null;

    @GetMapping("orderInsert")
    public String orderInsert(@RequestParam Map<String, Object> pMap){
        int result=0;
        result= orderLogic.orderInsert(pMap);
        if(result>0){ //주문등록 성공
            return "redirect:orderList";
        }else{ //주문등록 실패
            return "redirect:order/orderFail.jsp";
        }
    }

    @GetMapping("orderList")
    public String orderList(@RequestParam Map<String, Object> pMap, Model model){
        List<Map<String,Object>> oList = null;
        oList = orderLogic.orderList(pMap);
        model.addAttribute("oList", oList);
        return"payment/order";
    }

    @PostMapping("orderDelete")
    public void orderDelete(@RequestBody Map<String, Object> pMap, Model model){
        String str = (String)pMap.get("m_id");
        System.out.println(str);
        int m_id = Integer.parseInt(str);
        System.out.println("m_id int형변환" + m_id);
    }


}
