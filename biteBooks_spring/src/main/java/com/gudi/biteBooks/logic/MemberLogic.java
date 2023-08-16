package com.gudi.biteBooks.logic;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.biteBooks.dao.MemberDao;

@Service
public class MemberLogic {
    Logger logger = LoggerFactory.getLogger(MemberLogic.class);
    @Autowired
    private MemberDao memberDao = null;
    public List<Map<String, Object>> memberList() {
        List<Map<String, Object>> mList = null;
        mList = memberDao.memberList();
        return mList;
    }
    
}
