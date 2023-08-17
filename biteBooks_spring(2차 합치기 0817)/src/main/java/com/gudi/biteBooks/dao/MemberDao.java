package com.gudi.biteBooks.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gudi.biteBooks.vo.MemberVO;

@Repository
public class MemberDao {
    Logger logger = LoggerFactory.getLogger(MemberDao.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
        List<Map<String, Object>> mList = null;
        mList = sqlSessionTemplate.selectList("memberList", pMap);
        return mList;
    }

    public int memberInsert(Map<String, Object> pMap) {
        int result =-1;
        result = sqlSessionTemplate.insert("memberInsert", pMap);
        logger.info(String.valueOf(result));
        return result;
    }

    public int memberUpdate(Map<String, Object> pMap) {
        int result =-1;
        result = sqlSessionTemplate.update("memberUpdate", pMap);
        logger.info(String.valueOf(result));
        return result;
    }

    public int memberDelete(Map<String, Object> pMap) {
        int result =-1;
        result = sqlSessionTemplate.delete("memberDelete", pMap);
        logger.info("Dao"+String.valueOf(result));
        return result;
    }

    public int checkEmail(MemberVO mVO){
        int result = -1;
        result = sqlSessionTemplate.selectOne("checkEmail", mVO);
        return result;
    }

    public int checkNickname(MemberVO mVO) {
        logger.info("checkNickname");
        logger.info("mVO!!!!!!!!!!!!!!!!!! : " + mVO);
        int result = -1;
        result = sqlSessionTemplate.selectOne("checkNickname", mVO);
        logger.info("result!!!!!!!! : " + result);
        return result;
    }

    public Map<String, Object> loginCheck(Map<String, Object> pMap) {
        Map<String, Object> user = null;
        user = sqlSessionTemplate.selectOne("loginCheck", pMap);
        logger.info("userMap!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+user);
        return user;
    }

    public Map<String, Object> findEmail(Map<String, Object> pMap) {
        Map<String, Object> email = null;
        email = sqlSessionTemplate.selectOne("findEmail", pMap);
        logger.info("emailMap!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+email);
        return email;
    }

    public int updatePassword(Map<String, Object> pMap){
        int result = -1;
        result = sqlSessionTemplate.update("updatePassword", pMap);
        return result;
    }

    public Map<String, Object> getId(Map<String, Object> pMap) {
        Map<String, Object> userId = null;
        userId = sqlSessionTemplate.selectOne("getId", pMap);
        logger.info("userIdMap!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+userId);
        return userId;
    }
}
