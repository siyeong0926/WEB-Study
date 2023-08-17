<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<style>
    .nav-container{
        position: relative;
    }
    .search{
        outline: none;
        border: none;
        border-radius: 8px;
        background: url('/resources/img/research.png') no-repeat center center;
        background-color: lightgray;
        background-size: 25px;
        background-position: 95% center;
        padding: 5px 25px 5px 10px;
        margin-right:10px;
    }
    .signup-login{
        position: absolute;
        display: flex;
        right: 10%;
    }
    .main-logo{
        position: absolute;
        left:10%;
        width: 200px;
    }
    .main-button{
        display: inline-block;
        padding: 8px 16px;
        background-color:#2679ff;
        color: #ffffff;
        text-decoration: none;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        margin-left: 10px;
        font-size: 15px;
    }

    #type{
        position: absolute;
        left: 12%;
        top: -3px;
    }

    #type a:hover{
        color: #2679ff;
    }
    #my-menu{
        position: absolute;
        right: 10%;
    }
</style>
<header>
    <nav>
        <div class="nav-container" style="height: 100px; padding-top: 30px;">
            <a href="/book/main"><img class="main-logo" src="/resources/img/headerLogo.png" ></a>
            <ul class="signup-login">
                <% if (user == null) { %>
                    <li><a class="main-button" href="/member/signUp">회원가입</a></li>
                    <li><a class="main-button" href="/member/login">로그인</a></li>
                <% } else { %>
                    <li style="margin-top: 12px"><span style="color:#00a7ff; font-weight: bold"><%= nickname %></span>님 반갑습니다.</li>
                    <li>
                        <form action="/member/logout" method="post" style="display:inline;">
                            <button type="submit" class="main-button">로그아웃</button>
                        </form>
                    </li>
                <% } %>
            </ul>
        </div>
        <div class="nav-container" style="height: 40px;">
            <div id="type">
                <a href="#" style="margin-right: 5px;font-size: 23px;">웹툰</a>
                <a href="#" style="margin-right: 5px;font-size: 23px;">웹소설</a>
            </div>
<%--            <% if (user != null) { %>--%>
            <div id="my-menu">
                <div style="display: inline-block;">
                    <input type="text" class="search">
                </div>
                <a href="/cart/cartList"><i class="fa-solid fa-cart-shopping fa-xl" style="color: #375890; margin-right: 10px;"></i></a>
                <a href="#"><i class="fas fa-user fa-xl" style="color: #375890; margin-right: 10px;"></i></a>
                <a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                    <i class="fa-solid fa-bars fa-xl" style="color: #375890; margin-right: 10px;"></i>
                </a>
            </div>
<%--            <% } %>--%>
        </div>
    </nav>
    <div style="border: 0.5px solid lightgray;"></div>
</header>
<!-- offcanvas -->
<%@include file="offcanvas.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>