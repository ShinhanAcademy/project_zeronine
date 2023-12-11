<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/head.jsp"%>
<title>상품목록</title>
<link rel="stylesheet" href="${path}/css/product/productOrder.css" />
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="order_body">
		<div class="zero_container order_bodypart">
			<div class="order_bodypart_text">
				<span class="top_text">주문서</span>
			</div>

			<div class="orderinfo">
				<span class="orderinfo_text">주문내역</span>
				<div class="orderinfo_box">
					<div class="orderinfo_boxtext">
						<div class="infotext_space">
							<div class="infotext_space_left">
								<span class="box_text">옛날 오뚜기 500G, 1개</span>
							</div>
							<div class="infotext_space_right">
								<span class="box_text">3,000원</span>
							</div>
						</div>
						<div class="jul"></div>
						<!--  orderinfo_boxtext -->
					</div>
					<!-- orderinfo_box -->
				</div>
				<!-- orderinfo -->
			</div>


			<div class="twinbox">
				<div class="tw_box">
					<div class="tw_box_top">
						<p class="tw_boxtext">주문자 정보</p>
					</div>
					<div class="tw_wb">
						<div class="orderpinfo">
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">주문자명</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="방용수">
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">연락처</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="010-1234-5678">
								</div>

							</div>
							<div class="od1">
								<div class="odt-1">
									<p class="odt-t">이메일</p>
								</div>
								<div class="odd">
									<input type="text" class="odd_input" value="shinhan@naver.com">
								</div>

							</div>
						</div>
					</div>




				</div>
				<div class="tw_box">
					<div class="tw_box_top">
						<p class="tw_boxtext">배송지 정보</p>
					</div>
					<div class="tw_wb">
						<div class="deliverypinfo">
							<div class="delpinfo">
							<dl>
							<dt id="order_name">
							방용수
							</dt>
							<dd id="order_address">
							[11021]경기 파주시 저어딘가요 55 109동1004호
							</dd>
							</dl>
							<div class="delpPhone">
							<span id="order_phone">010-1234-4567</span>
							</div>
							</div>
							
						</div>

					<!-- tw_wb -->
					</div>
					<!-- tw_box -->
				</div>
				<!-- twinbox -->
			</div>
			<div class="p_box">
			<div class="p_box_top">
			<p class="p_boxtext" >포인트</p>
			</div>
			<div class="p_wb">
			<div class="p_b">
			<div class="p_info">
			<dl>
			<dt>포인트 적용</dt>
			<dd><input type="text" value="0" name="p_poing" id="p_point" class="p_input">
			<p class="useable_point">사용가능한 적립금 <strong>1500원</strong></p> 
			<button type="button" class=
			"useptbtn" name="useptbtn" id="useptbtn">모두사용</button>
			
			</dd>
			</dl>
			
			</div>
			</div>
			
			</div>
			
			
			<!-- tw_box -->
			</div>




























			<!-- order-bodypart -->
		</div>
	</div>

	<%@include file="../common/footer.jsp"%>
	<script>
		var path = "${path}";
	</script>
</body>
</html>
