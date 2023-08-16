package com.gudi.biteBooks.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.gudi.biteBooks.logic.MemberLogic;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/member/*")
public class MemberController {
    Logger logger = LoggerFactory.getLogger(MemberController.class);
    @Autowired
    private MemberLogic memberLogic = null;
    
    @GetMapping("memberList")
    public String memberList(Model model){
        List<Map<String,Object>> mList = null;
        String temp= null;
        mList = memberLogic.memberList();
        Gson g = new Gson();
        temp = g.toJson(mList);
        return temp;
    }
}
