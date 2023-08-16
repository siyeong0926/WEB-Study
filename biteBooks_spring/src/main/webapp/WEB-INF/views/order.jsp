<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/order.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	
	// 주문정보 최신화
	setTotalInfo();
	
	
	// 로그아웃 버튼 작동
	$("#gnb_logout_button").click(function(){
		//alert("버튼 작동");
		
		$.ajax({
			type:"POST",
			url:"/member/logout",
			success:function(data){
				alert("로그아웃 성공");
				document.location.reload();
			}
		});
	});	
	
	// 포인트 입력
	// 0 이상 & 최대 포인트 수 이하
	$(".order_point_input").on("propertychange change keyup paste input", function(){
		
		// 문자열 인식 오류 paseInt() 메소드 사용
		const maxPoint = parseInt('${memberInfo.point}');
		
		let inputValue = parseInt($(this).val());
		
		if(inputValue < 0){
			$(this).val(0); //0 보다 작은값(음수) 입력시 0
		} else if (inputValue > maxPoint){
			$(this).val(maxPoint); // 가진 포인트보다 더큰 포인트 입력시 가진포인트 전부 입력
		}
		
		// 주문 정보 최신화
		setTotalInfo();
	});
	
	// 포인트 모두사용 or 취소 버튼
	// N: 모두 사용 상태 , Y : 모두 취소 상태
	$(".order_point_input_btn").on("click",function(){
		
		const maxPoint = parseInt('${memberInfo.point}');
		
		let state = $(this).data("state"); // data-state 속성 값
		
		if(state == 'N'){
			//모두 사용
			//console.log("N")
			$(".order_point_input").val(maxPoint); //값 변경
			
			$(".order_point_input_btn_Y").css("display", "inline-block");
			$(".order_point_input_btn_N").css("display", "none");
		} else if (state == 'Y'){
			// 모두 취소
			//console.log("Y")
			$(".order_point_input").val(0); //값 변경
			
			$(".order_point_input_btn_Y").css("display", "none");
			$(".order_point_input_btn_N").css("display", "inline-block");
		}		
		
		// 주문 정보 최신화
		setTotalInfo();
	});
	
	// 이미지 삽입
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("bookid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/book/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
		}
		
	});
	
	// 주문요청
	$(".order_btn").on("click", function(){
		console.log("test")
		// 주소 정보 & 받는이
		$(".addressInfo_input_div").each(function(i,obj){
			if($(obj).find(".selectAddress").val() === 'T'){
				$("input[name='addressee']").val($(obj).find(".addressee_input").val());
				$("input[name='member_addr1']").val($(obj).find(".address1_input").val());
				$("input[name='member_addr2']").val($(obj).find(".address2_input").val());
				$("input[name='member_addr3']").val($(obj).find(".address3_input").val());
			}
			
		});
		// 사용 포인트
		$("input[name='use_point']").val($(".order_point_input").val());
		
		//상품정보
		let form_contents = ''; 
		$(".goods_table_price_td").each(function(index, element){
			let bookId = $(element).find(".individual_bookId_input").val();
			let bookCount = $(element).find(".individual_bookCount_input").val();
			let bookId_input = "<input name='orders[" + index + "].bookId' type='hidden' value='" + bookId + "'>";
			form_contents += bookId_input;
			let bookCount_input = "<input name='orders[" + index + "].book_count' type='hidden' value='" + bookCount + "'>";
			form_contents += bookCount_input;
		});	
		$(".order_form").append(form_contents);	
		
		
		console.log(form_contents)
		
		//서버전송
		$(".order_form").submit();
	});
		
		
	
		
		

});

// 주소입력란 버튼 동작(숨김, 등장)
function showAdress(className){
		// 모두 숨기기
		$(".addressInfo_input_div").css('display', 'none');
		
		// 컨텐츠 보이기
		$(".addressInfo_input_div_" + className).css('display','block')
		
		//버튼 색상 
		
		//모든 색상 동일
		$(".address_btn").css('backgroundColor', '#555');
		
		// 지정 색상 변경
		$(".address_btn_"+className).css('backgroundColor', '#3c3838');
		
		// 사용자 정보 주소록 T , 직접입력 F
		// 직접입력 F
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
				console.log($(obj).find(".selectAddress").val("F"))
			});
		// 사용자 정보 주소록 T
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");
}

// 다음 주소 API
function execution_daum_address(){
 		//console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}

//총 주문 정보 세팅
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".goods_table_price_td").each(function(index,element){
		
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		totalKind += 1;
		
		totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
		
	});
	
	// 배송비 결정
	if(totalPrice >= 30000){
		deliveryPrice = 0;
		
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;
	}
	
	finalTotalPrice = totalPrice + deliveryPrice;
	
	// 사용포인트 계산		
	usePoint = $(".order_point_input").val();
	finalTotalPrice = totalPrice - usePoint;
	
	//값 넣기
	$(".totalPrice_span").text(totalPrice.toLocaleString());			// 총 가격
	$(".goods_kind_div_count").text(totalCount);						// 총 갯수
	$(".goods_kind_div_kind").text(totalKind);							// 총 종류
	$(".totalPoint_span").text(totalPoint.toLocaleString());			// 총 마일리지
	$(".delivery_price_span").text(deliveryPrice.toLocaleString()); 	// 총 배송비
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());	// 최종 가격
	$(".usePoint_span").text(usePoint.toLocaleString());				// 할인가(사용 포인트)
}



</script>
</head>
<body>

<!-- 주문 요청 form -->
<form class="order_form" action="/order" method="post">
	<!-- 주문자 회원번호 -->
	<input name="member_id" value="${memberInfo.member_id}" type="hidden">
	<!-- 주소록 & 받는이 -->
	<input name="addressee" type="hidden">
	<input name="member_addr1" type="hidden">
	<input name="member_addr2" type="hidden">
	<input name="member_addr3" type="hidden">
	<!-- 사용 포인트 -->
	<input name="use_point" type="hidden">
	<!-- 상품 정보 -->
</form>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test = "${member == null}">	<!-- 로그인 x -->	
					<li >
						<a href="/member/login">로그인</a>
					</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
				</c:if>
				<c:if test="${member != null }">	<!-- 로그인 o -->		
					<c:if test="${member.admin_ck == 1 }">	<!-- 관리자 계정 -->
						<li><a href="/book/main">관리자 페이지</a></li>
					</c:if>							
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>
						<a href="/cart/${member.member_id}">장바구니</a>
					</li>
				</c:if>							
			</ul>			
		</div>
		
		<div class="top_area">
			<!-- 로고영역 -->
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/mLogo.png"></a>
			</div>
			<div class="login_area">
			
				<!-- 로그인 하지 않은 상태 -->
				<c:if test = "${member == null }">
					<div class="login_button"><a href="/member/login">로그인</a></div>
					<span><a href="/member/join">회원가입</a></span>				
				</c:if>				
				
				<!-- 로그인한 상태 -->
				<c:if test="${ member != null }">
					<div class="login_success_area">
						<span>회원 : ${member.member_name}</span>
						<span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
						<span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
						
					</div>
				</c:if>
				
			</div>
			<div class="clearfix"></div>			
		</div>
		
		<div class="orderGoods_div">
			<!-- 상품 종류 -->
			<div class="goods_kind_div">
				주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
			</div>
			<!-- 상품 테이블 -->
			<table class="goods_subject_table">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">		
				</colgroup>
				<tbody>
					<tr>
						<th>이미지</th>
						<th>상품 정보</th>
						<th>판매가</th>
					</tr>
				</tbody>
			</table>
			
			<table class="goods_table">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">
				</colgroup>
				<tbody>
					<c:forEach items="${orderList}" var="ol">
						<tr>
							<td>
								<div class="image_wrap" data-bookid="${ol.imageList[0].bookId}" data-path="${ol.imageList[0].uploadPath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
									<img>
								</div>
							</td>
							
							<td>${ol.bookName}</td>
							<td class="goods_table_price_td">
								<fmt:formatNumber value="${ol.sale_price}" pattern="#,### 원"/> | 수량 ${ol.book_count}개
								<br><fmt:formatNumber value="${ol.total_price}" pattern="#,### 원" />
								<br>[<fmt:formatNumber value="${ol.total_point}" pattern="#,### 원" />P]
								<input type="hidden" class="individual_bookPrice_input" value="${ol.bookPrice }">
								<input type="hidden" class="individual_salePrice_input" value="${ol.sale_price }">
								<input type="hidden" class="individual_bookCount_input" value="${ol.book_count }">
								<input type="hidden" class="individual_totalPrice_input" value="${ol.total_price }">
								<input type="hidden" class="individual_point_input" value="${ol.point }">
								<input type="hidden" class="individual_totalPoint_input" value="${ol.total_point}">
								<input type="hidden" class="individual_bookId_input" value="${ol.bookId }">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="point_div">
			<div class="point_div_subject">포인트 사용</div>
			<table class="point_table">
				<colgroup>
					<col width="25%">
					<col width="*">
				</colgroup>
				
				<tbody>
					<tr>
						<th>포인트 사용</th>
						<td>
							${memberInfo.point} | <input class="order_point_input" value="0">원
							<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
							<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용 취소</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="total_info_div">
			<!-- 가격 종합 정보 -->
			<div class="total_info_price_div">
				<ul>
					<li>
						<span class="price_span_label">상품 금액</span>
						<span class="totalPrice_span">100000</span>원
					</li>
					<li>
						<span class="price_span_label">배송비</span>
						<span class="delivery_price_span">100000</span>원
					</li>
					<li>
						<span class="price_span_label">할인금액</span>
						<span class="usePoint_span">100000</span>원
					</li>
					<li class="price_total_li">
						<strong class="price_span_label total_price_label">최종 결제 금액</strong>
						<strong class="strong_red">
							<span class="total_price_red finalTotalPrice_span">
								1500000
							</span>원
						</strong>
					</li>
					
					<li class="point_li">
						<span class="price_span_label">적립예정 포인트</span>
						<span class="totalPoint_span">7960원</span>
					</li>
				</ul>
			</div>
			
			<!-- 버튼 영역 -->
			<div class="total_info_btn_div">
			<button class="order_btn">결제하기</button>
			</div> 
			
		</div>
		
		<div class="content_area">
				<div class="content_main">
					<!-- 회원 정보 -->
					<div class ="member_info_div">
						<table class="table_text_align_center memberInfo_table">
							<tbody>
								<tr>
									<th style="width: 25%;">주문자</th>
									<td style="width: *">${memberInfo.member_name} | ${memberInfo.member_mail}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 배송지 정보 -->
					<div class="addressInfo_div">
						<div class="addressInfo_button_div">
							<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color:#3c3838;">사용자 주소록 사용</button>
							<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
						</div>
						
						<div class="addressInfo_input_div_wrap">
							<div class="addressInfo_input_div addressInfo_input_div_1"  style="display: block">
								<table>
									<colgroup>
										<col width="25%">
										<col width="">
									</colgroup>
									
									<tbody>
										<tr>
											<th>이름</th>
											<td>
												${memberInfo.member_name }
											</td>
										</tr>
										
										<tr>
											<th>주소</th>
											<td>
												${memberInfo.member_addr1} ${memberInfo.member_addr2} <br> ${memberInfo.member_addr3}
												<input class="selectAddress" value="T" type="hidden">
												<input class="addressee_input" value="${memberInfo.member_name}" type="hidden">
												<input class="address1_input" type="hidden" value="${memberInfo.member_addr1}">
												<input class="address2_input" type="hidden" value="${memberInfo.member_addr2}">
												<input class="address3_input" type="hidden" value="${memberInfo.member_addr3}">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="addressInfo_input_div addressInfo_input_div_2" >
								<table>
									<colgroup>
										<col width="25%">
										<col width="">
									</colgroup>
									
									<tbody>
										<tr>
											<th>이름</th>
											<td>
												<input class="addressee_input">
											</td>
										</tr>
										
										<tr>
											<th>주소</th>
											<td>
												<input class="selectAddress" value="F" type="hidden">
												<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
												<input class="address2_input" readonly="readonly"><br>
												<input class="address3_input" readonly="readonly">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 상품 정보 -->
					<!-- 포인트 정보 -->
					<!-- 주문 통합 정보 -->
				</div>

			
		</div>
		
		<!-- Footer 영역 -->
		<div class="footer_nav">
			<div class="footer_nav_container">
				<ul>
					<li>회사소개</li>
					<span class="line">|</span>
					<li>이용약관</li>
					<span class="line">|</span>
					<li>고객센터</li>
					<span class="line">|</span>
					<li>광고문의</li>
					<span class="line">|</span>
					<li>채용정보</li>
					<span class="line">|</span>
				</ul>
			</div>
		</div> <!-- class="footer_nav" -->
		
		<div class="footer">
			<div class="footer_container">
				
				<div class="footer_left">
					<img src="/resources/img/Logo.png">
				</div>
				<div class="footer_right">
					(주) VamBook    대표이사 : OOO
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo(발신자 부담전화)
					<br>
					<br>
					COPYRIGHT(C) <strong>kimvampa.tistory.com</strong>	ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script>

</script>

</body>
</html>