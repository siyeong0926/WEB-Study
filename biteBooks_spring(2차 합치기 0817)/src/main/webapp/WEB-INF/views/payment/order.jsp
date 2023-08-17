<%@ page import="java.util.Map, java.util.List" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String tab = (String)request.getParameter("tab");
    String user = (String)session.getAttribute("m_id");
    String nickname = (String)session.getAttribute("m_nickname");

    int size = 0;//지변이니까 초기화를 생략하면 에러발생함.
    List<Map<String,Object>> oList = (List<Map<String,Object>>)request.getAttribute("oList");
    if(oList !=null){
        size = oList.size();
    }
    for (int i = 0; i < oList.size(); i++) {
        out.print(oList.get(i));
    }
%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/resources/cdn/common.html"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/order.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <title>결제페이지</title>
</head>
<body>
<%@include file="../common/mainHeader.jsp"%>
<div class="main-container">
    <div class="order-left">
        <div class="container-sm">
            <h6 style="margin-bottom: -5px;">주문 목록</h6>
            <div class="order-table">
                <table class="table" style="text-align: start;">
                    <thead>
                    <tr>
                        <th scope="col" colspan="2">
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (int i = 0; i < oList.size(); i++) {
                        Map<String,Object> rmap = oList.get(i);
                    %>
                    <input type="hidden" value="<%=rmap.get("m_id")%>" name="m_id">
                    <tr>
                        <th scope="row" style="width: 20%;">
                            <div class="thumbnail-container">
                                <img class="order-thumbnail" src=<%=rmap.get("b_thumbnail")%>>
                            </div>
                        </th>
                        <td>
                            <div class="order-contnet">
                                <div class="content-title">
                                    <h6><%=rmap.get("b_title")%></h6>
                                </div>
                                <div class="content-writer-price">
                                    <p style="font-size: small; color: gray;"><%=rmap.get("b_author")%></p>
                                    <h6 class="pay-eachPrice" style="color: #2679ff;">
                                        <% if("대여".equals(rmap.get("c_type"))){ %>
                                        <span data-price="<%= rmap.get("ep_rprice") %>"><%=rmap.get("ep_rprice")%></span>원
                                        <% } else { %>
                                        <span data-price="<%= rmap.get("ep_cprice") %>"><%= rmap.get("ep_cprice") %></span>원
                                        <% } %>
                                    </h6>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-------------------------오른쪽 페이지 시작------------------------------>
    <div class="order-right">
        <div class="container-sm">
            <div style="margin-left: 20px;">
                <h6>결제 정보</h6>
                <div class="pay-table">
                    <table class="table" style="text-align: start;">
                        <tbody>
                        <tr>
                            <th scope="row" class="total-price-head">
                                <p style="font-size: small;">총 주문 금액</p>
                                <p class="pay-totalPrice"><span></span>원</p>

                            </th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <h6>결제 정보</h6>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <h6>결제 정보</h6>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <h6>결제 정보</h6>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <div class="total-price-foot">
                        <p class="pay-totalPrice">총 결제 금액 <span style="color: #2679ff; font-size: large;">0</span>원</p>
                    </div>
                </div>
                <!-----------------------------결제수단블럭-------------------->
                <div style="display: flex;">
                    <div style="margin-top: 10px;">
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="credit-card" checked>
                                신용카드
                            </label>
                        </div>
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="paypal">
                                페이팔
                            </label>
                        </div>
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="bank-account">
                                무통장 입금
                            </label>
                        </div>
                    </div>
                    <div style="margin-top: 10px;">
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="credit-card">
                                카카오페이
                            </label>
                        </div>
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="paypal">
                                네이버페이
                            </label>
                        </div>
                        <div class="payment-method">
                            <label>
                                <input type="radio" name="payment" value="bank-account">
                                페이코
                            </label>
                        </div>
                    </div>
                </div><!--end of payment box-->
                <!------------------------------구매동의 박스-------------------------------->
                <div class="pay-agreement">
                    <h6>구매 동의</h6>
                    <div class="form-check" style="font-size: small;">
                        <input class="form-check-input agree-check" type="checkbox" name="option[]" value="">
                        <label class="form-check-label">상품, 가격, 할인 정보, 유의 사항 등을 확인하였으며 구매에 동의합니다.</label>
                    </div>
                    <div class="checkout-button">
                        <button>결제하기</button>
                    </div>
                    <ul class="agreement-li" style="padding: 10px;">
                        <li>결제 취소는 결제일로부터 7일 이내에만 할 수 있습니다.</li>
                        <li>다운로드하거나 (다운로드 시작 포함) 스트리밍으로 이용한 책은 구매 취소하거나 환불받을 수 없습니다.</li>
                        <li>미성년자의 경우 결제 시 법정대리인의 동의가 필요하며, 이에 따라 법정대리인의 동의를 받았음을 확인합니다.</li>
                    </ul>
                </div>
            </div><!--end of content box-->
        </div><!--end of container-->
    </div> <!--end of right page-->
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    <%------------------------주문건 금액 합산하여 총금액에 반영하는 함수---------------------%>
    $(document).ready(function() {
        let totalPrice = 0;
        // 모든 가격 요소를 선택하고 가격을 추출하여 합산
        $('.pay-eachPrice span').each(function() {
            const price = parseInt($(this).data('price'), 10);
            if (!isNaN(price)) {
                totalPrice += price;
            }
            $('.pay-totalPrice span').text(totalPrice);
        });<%------------------------주문건 금액 합산하여 총금액에 반영하는 함수---------------------%>

        <%----------------------------------창꺼지면 데이터전송---------------------------------------%>
        $(window).on('beforeunload', function() {
            $.ajax({
                type: 'POST',
                contentType: 'application/json', // JSON 데이터를 보내므로 콘텐츠 유형을 지정
                data: JSON.stringify({ m_id: '1' }), // 실제 회원 아이디로 대체
                url: '/order/orderDelete',
                async: true
            });
        });<%----------------------창꺼지면 데이터전송------------------------------%>

        // 페이지를 벗어날 때 경고창을 띄우는 이벤트 핸들러를 등록합니다.
        window.addEventListener("beforeunload", function(event) {
            // 이벤트 메시지 설정 (표준 메시지 대신 사용자 정의 메시지를 사용할 수 있습니다)
            let confirmationMessage = "변경사항이 저장되지 않을 수 있습니다. 정말 이동하시겠습니까?";

            // 경고 메시지를 브라우저에 표시합니다.
            event.returnValue = confirmationMessage;  // 브라우저에 따라 작동하지 않을 수 있습니다.
            return confirmationMessage;
        });

// 사용자가 "확인" 버튼을 누를 경우 경고창을 닫습니다.
        function closeWarning() {
            window.removeEventListener("beforeunload", function(event) {});
        }

    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>