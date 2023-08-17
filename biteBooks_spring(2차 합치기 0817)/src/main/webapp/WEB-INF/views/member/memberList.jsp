<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버리스트</title>
</head>
<body>
    <h1>회원목록</h1>
<table border="1">
    <tr>
      <th>회원번호</th>
      <th>이름</th>
      <th>이메일</th>
    </tr>
    <c:forEach var="member" items="${mList}">
      <tr>
        <td>${member.m_id}</td>
        <td>${member.m_name}</td>
        <td>${member.m_email}</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>