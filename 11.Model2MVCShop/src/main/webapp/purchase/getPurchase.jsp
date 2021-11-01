<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a[href='#' ]").on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			history.go(-1);
		});
		
		 $( "button" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
			});
	});
	
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<input type="hidden" name="prodNo" value="${product.prodNo }">
	
		<div class="page-header">
	       <h3 class=" text-info">구매상세조회</h3>
	       <h5 class="text-muted">구매 정보를 <strong class="text-danger">확인 </strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4"> ${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:if test="${purchase.paymentOption != null }">
			      	<c:if test="${purchase.paymentOption eq '1' }">
			      		현금결제
			      	</c:if>
			      	<c:if test="${purchase.paymentOption eq '2' }">
			      		카드결제
			      	</c:if>
			      </c:if>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<c:if test="${purchase.tranCode == '001' }">
	  				<button type="button" class="btn btn-primary">수정</button>
	  			</c:if>
	  			<c:if test="${purchase.tranCode == '002' }">
	  				<button type="button" class="btn btn-primary">수정</button>
	  			</c:if>
	  			<a class="btn btn-primary btn" href="#" role="button">확 &nbsp;인</a>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>


<!-- //////////////////////// -->
<html>
<head>
<title>구매상세조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			history.go(-1);
		});
		
		 $( "td.ct_btn01:contains('수정')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
			});
	});
	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td width="15" height="37">
         <img src="/images/ct_ttl_img01.gif"   width="15" height="37"/>
      </td>
      <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="93%" class="ct_ttl01">구매상세조회</td>
               <td width="20%" align="right">&nbsp;</td>
            </tr>
         </table>
      </td>
      <td width="12" height="37">
         <img src="/images/ct_ttl_img03.gif"   width="12" height="37"/>
      </td>
   </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"   style="margin-top: 13px;">
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">
         물품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
      </td>
      <td bgcolor="D6D6D6" width="1"></td>
      <td class="ct_write01">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="105">
               <%--<%=purchaseVO.getPurchaseProd().getProdNo() --%>
               ${purchase.purchaseProd.prodNo}
               </td>
               <td></td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">
         구매자아이디 <img   src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
      </td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%-- <td class="ct_write01"><%=userVO.getUserId() %></td>--%>
      <td class="ct_write01">${user.userId}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>

   <tr>
      <td width="104" class="ct_write">구매방법</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <td class="ct_write01">
      
      <c:if test="${purchase.paymentOption != null }">
      	<c:if test="${purchase.paymentOption eq '1' }">
      		현금결제
      	</c:if>
      	<c:if test="${purchase.paymentOption eq '2' }">
      		카드결제
      	</c:if>
      </c:if>
      	
      </td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">구매자이름</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%-- <td class="ct_write01"><%=purchaseVO.getReceiverName() %></td>--%>
      <td class="ct_write01">${purchase.receiverName}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">구매자연락처</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getReceiverPhone() %></td> --%>
      <td class="ct_write01">${purchase.receiverPhone }</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">구매자주소</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyAddr() %></td> --%>
      <td class="ct_write01">${purchase.divyAddr}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">구매요청사항</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyRequest() %></td> --%>
      <td class="ct_write01">${purchase.divyRequest }</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">배송희망일</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyDate() %></td> --%>
      <td class="ct_write01">${purchase.divyDate }</td>
   </tr>

   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>

   <tr>
      <td width="104" class="ct_write">주문일</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%-- <td class="ct_write01"><%=purchaseVO.getOrderDate() %></td>--%>
      <td class="ct_write01">${purchase.orderDate}</td>
   </tr>

   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"   style="margin-top: 10px;">
   <tr>
      <td width="53%"></td>
      <td align="right">
         <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <c:if test="${purchase.tranCode == '001' }">
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
               </td>
               
               <td background="/images/ct_btnbg02.gif" class="ct_btn01"   style="padding-top: 3px;">
                  <%-- <a href="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo()%>">수정</a>--%>
                  	 <!-- //////////////////////////
                  	<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo }">수정</a>
                  //////////////////////// -->
                  수정
               </td>
             
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
               </td>
               
            </c:if>
            <c:if test="${purchase.tranCode == '002' }">
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
               </td>
               
               <td background="/images/ct_btnbg02.gif" class="ct_btn01"   style="padding-top: 3px;">
                  <%-- <a href="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo()%>">수정</a>--%>
                  <!-- /////////////////////////////////
                  	<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo }">수정</a>
                  //////////////////////// -->
                  수정
               </td>
             
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
               </td>
               
            </c:if>
               <td width="30"></td>
               <td width="17" height="23">
                  <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
               </td>
               <td background="/images/ct_btnbg02.gif" class="ct_btn01"   style="padding-top: 3px;">
               <!-- /////////////////////////////////
                  <a href="javascript:history.go(-1);">확인</a>
                  ///////////////-->
                  확인
               </td>
               <td width="14" height="23">
                  <img src="/images/ct_btnbg03.gif"width="14" height="23"/>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>

</body>
</html>