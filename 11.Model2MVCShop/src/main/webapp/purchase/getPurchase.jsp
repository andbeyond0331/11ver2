<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
		
	//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		$("a[href='#' ]").on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			history.go(-1);
		});
		
		 $( "button" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				self.location = "/purchase/updatePurchase?tranNo=${purchase.tranNo}"
			});
	});
	
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<input type="hidden" name="prodNo" value="${product.prodNo }">
	
		<div class="page-header">
	       <h3 class=" text-info">���Ż���ȸ</h3>
	       <h5 class="text-muted">���� ������ <strong class="text-danger">Ȯ�� </strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4"> ${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:if test="${purchase.paymentOption != null }">
			      	<c:if test="${purchase.paymentOption eq '1' }">
			      		���ݰ���
			      	</c:if>
			      	<c:if test="${purchase.paymentOption eq '2' }">
			      		ī�����
			      	</c:if>
			      </c:if>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ֹ���</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<c:if test="${purchase.tranCode == '001' }">
	  				<button type="button" class="btn btn-primary">����</button>
	  			</c:if>
	  			<c:if test="${purchase.tranCode == '002' }">
	  				<button type="button" class="btn btn-primary">����</button>
	  			</c:if>
	  			<a class="btn btn-primary btn" href="#" role="button">Ȯ &nbsp;��</a>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>


<!-- //////////////////////// -->
<html>
<head>
<title>���Ż���ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			history.go(-1);
		});
		
		 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
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
               <td width="93%" class="ct_ttl01">���Ż���ȸ</td>
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
         ��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
         �����ھ��̵� <img   src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
      </td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%-- <td class="ct_write01"><%=userVO.getUserId() %></td>--%>
      <td class="ct_write01">${user.userId}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>

   <tr>
      <td width="104" class="ct_write">���Ź��</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <td class="ct_write01">
      
      <c:if test="${purchase.paymentOption != null }">
      	<c:if test="${purchase.paymentOption eq '1' }">
      		���ݰ���
      	</c:if>
      	<c:if test="${purchase.paymentOption eq '2' }">
      		ī�����
      	</c:if>
      </c:if>
      	
      </td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">�������̸�</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%-- <td class="ct_write01"><%=purchaseVO.getReceiverName() %></td>--%>
      <td class="ct_write01">${purchase.receiverName}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">�����ڿ���ó</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getReceiverPhone() %></td> --%>
      <td class="ct_write01">${purchase.receiverPhone }</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">�������ּ�</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyAddr() %></td> --%>
      <td class="ct_write01">${purchase.divyAddr}</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">���ſ�û����</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyRequest() %></td> --%>
      <td class="ct_write01">${purchase.divyRequest }</td>
   </tr>
   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>
   <tr>
      <td width="104" class="ct_write">��������</td>
      <td bgcolor="D6D6D6" width="1"></td>
      <%--<td class="ct_write01"><%=purchaseVO.getDivyDate() %></td> --%>
      <td class="ct_write01">${purchase.divyDate }</td>
   </tr>

   <tr>
      <td height="1" colspan="3" bgcolor="D6D6D6"></td>
   </tr>

   <tr>
      <td width="104" class="ct_write">�ֹ���</td>
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
                  <%-- <a href="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo()%>">����</a>--%>
                  	 <!-- //////////////////////////
                  	<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo }">����</a>
                  //////////////////////// -->
                  ����
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
                  <%-- <a href="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo()%>">����</a>--%>
                  <!-- /////////////////////////////////
                  	<a href="/purchase/updatePurchase?tranNo=${purchase.tranNo }">����</a>
                  //////////////////////// -->
                  ����
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
                  <a href="javascript:history.go(-1);">Ȯ��</a>
                  ///////////////-->
                  Ȯ��
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