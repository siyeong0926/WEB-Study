<%--
  Created by IntelliJ IDEA.
  User: mkchocho
  Date: 2023/08/09
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="cart-tab">
    <div style="background-color: rgb(216, 216, 216); border: 1px solid rgb(170, 170, 170); border-top: none; border-left: none;">
        <a href="/cart/cartList?tab=collect">소장하기</a>
    </div>
    <div style="background-color: white;">
        <a href="/cart/cartList?tab=rental">대여하기</a>
        <input type="hidden" name="C_TYPE" value="RENTAL" >
    </div>
</div>
