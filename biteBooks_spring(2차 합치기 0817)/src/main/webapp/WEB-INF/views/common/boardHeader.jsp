<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<style>
    .qna-button{
        position: absolute;
        display: flex;
        right: 15%;
    }
    .container {
        height: 70px;
        align-items: center; /* 수직 가운데 정렬 */
        justify-content: space-between; /* 요소 사이에 여백을 생성하여 오른쪽으로 밀착 */
    }
    .main-logo{
        position: absolute;
        cursor: pointer;
        left:15%;
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
</style>
<header>
    <nav>
        <div class="container" style="margin-top: 20px; margin-bottom: 10px;">
            <img class="main-logo" href="/book/main" src="/resources/img/headerLogo.png" >
            <ul class="qna-button">
                <li><a class="main-button" href="#">문의내역</a></li>
                <li><a class="main-button" href="#">문의등록</a></li>
            </ul>
        </div>
    </nav>
    <div style="border: 0.5px solid lightgray;"></div>
</header>