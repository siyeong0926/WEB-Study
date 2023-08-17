<%@ page import="java.util.Map, java.util.List" %>
<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%
    String tab = (String)request.getParameter("tab");
    String user = (String)session.getAttribute("m_id");
    String nickname = (String)session.getAttribute("m_nickname");

    int size = 0;//지변이니까 초기화를 생략하면 에러발생함.
    List<Map<String,Object>> cList = (List<Map<String,Object>>)request.getAttribute("cList");
    if(cList !=null){
        size = cList.size();
    }
    for (int i = 0; i < cList.size(); i++) {
        out.print(cList.get(i));
    }
%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/resources/cdn/common.html"%>
    <link rel="stylesheet" href="/resources/css/cart.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <title>장바구니</title>
</head>
<body>

<%@include file="../common/mainHeader.jsp"%>

<div class="main-container">
    <div class="cart-left">
        <div class="container-sm" >
            <h4 style="display: block; margin-bottom:-8%; margin-top: 10%;">카트</h4>
            <div class="cart-content  text-center">
<%----------------------cartTab 시작--------------------------%>
                <%if(tab==null||"rental".equals(tab)){%>
                <%@include file="cartRental.jsp"%>
    <%}else if("collect".equals(tab)){%>
                <%@include file="cartCollect.jsp"%>
    <%}%>
<%----------------------cartTab 끝--------------------------%>
                <div class="cart-table">
                    <table class="table" style="text-align: start;">
                        <thead>
                        <tr>
                            <th scope="col" style="width: 20%;">
                                <div class="form-check cart-check check-all">
                                    <input class="form-check-input" type="checkbox" id="selectAll">
                                    <label class="form-check-label" for="selectAll">전체 선택</label>
                                </div>
                            </th>
                            <th colspan="2" style="text-align: right;"><button class="white-button">선택 삭제</button></th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for (int i = 0; i < cList.size(); i++) {
                            Map<String,Object> rmap = cList.get(i);
                        %>
                        <tr>
                            <th scope="row">
                                <div class="form-check cart-check check-option">
                                    <input class="form-check-input" type="checkbox" name="cartToOrder[]" value="<%=rmap.get("c_no")%>"
                                           data-price="<% if("rental".equals(tab)){out.print(rmap.get("ep_rprice"));}else{out.print(rmap.get("ep_cprice"));} %>">
                                    <label class="form-check-label"><img class="cart-thumbnail" src=<%=rmap.get("b_thumbnail")%>></label>
                                </div>
                            </th>
                            <td>
                                <div class="cart-product">
                                    <h6><%=rmap.get("b_title")%><% if(0 != (int)(rmap.get("ep_no"))){ out.print((int)(rmap.get("ep_no"))+"화");}%></h6>
                                    <p class="text-writer"><%=rmap.get("b_author")%></p>
                                </div>
                            </td>
                            <td>
                                <div class="cart-cost">
                                    <p><% if("rental".equals(tab)){out.print(rmap.get("ep_rprice"));}else{out.print(rmap.get("ep_cprice"));} %>원</p>
                                    <button class="white-button">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!------------------------오른쪽 페이지 시작---------------------------------->
    <div class="cart-right">
        <div class="cart-pay">
            <div class="pay-cost">
                <div class="pay-quantity">
                    <div style="display: flex;">
                        <i class="fa-solid fa-circle-check" style="margin-top: 2px; color: #95b4ea;"></i>
                        <p id="selectedCount" style="color: #7f9cce;">0개를 선택하셨습니다.</p>
                    </div>
                    <div class="pay-quantity-align"><p>총 상품 금액</p><p class="totalPrice">0원</p></div>
                    <div class="pay-quantity-align"><p>할인 금액</p><p>0원</p></div>
                </div>
                <div class="pay-total">
                    <div class="total-content">
                        <p style="margin-top: 5px;">합계</p>
                        <b><p class="totalPrice" id="totalPrice">0원</p></b>
                    </div>
                </div>
            </div>
            <div class="button-container">
                <button class="pay-button"><a href="/order/orderInsert">소장으로 구매하기</a></button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/cartCheckbox.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>