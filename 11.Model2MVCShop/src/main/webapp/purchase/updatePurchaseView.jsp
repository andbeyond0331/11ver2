<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="com.model2.mvc.service.domain.*" %>

	

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--  �޷� ������ �߰�(jQuery) -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>�������� ����</title>
<!-- jQuery/////////
<script type="text/javascript" src="../javascript/calendar.js">
</script>////// -->

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="http://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script type="text/javascript">

//====����Code �ּ� ó�� �� jQuery ���� =====//
function fncUpdatePurchase(){
	var tranNo=$("input[name='tranNo']").val();
	//alert("tranNo : " + tranNo);
	$("form").attr("method","POST").attr("action","/purchase/updatePurchase?tranNo="+tranNo).submit();
}

$(function(){
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			$("form")[0].reset();
	});
	
	 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			fncUpdatePurchase();
	});
});	

$(function(){
	$($('input:text[name="divyDate"]')).datepicker({
		showOn : "button",
		buttonImage: "../images/ct_icon_date.gif",
		buttonImageOnly: true,
		buttonText: "Select date"
		
	});
	
	$($('input:text[name="divyDate"]')).datepicker( "option", "showAnim", "bounce" );
	$($('input:text[name="divyDate"]')).datepicker( "option", "dateFormat", "yy-mm-dd" );
	
	var divyDate = $("#datepicker").val();
	console.log(divyDate);
	
	$("#datepicker").val(divyDate);
});

</script>


</head>

<body bgcolor="#ffffff" text="#000000">
<%-- <form name="updatePurchase" method="post"	action="/updatePurchase.do?tranNo=<%=purchaseVO.getTranNo()%>">--%>
<form name="updatePurchase">

<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif"  width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">������������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ھ��̵�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=userVO.getUserId()%></td>--%>
		<td class="ct_write01">${purchase.buyer.userId}</td>
		<%-- <input type="hidden" name="buyer.userId" value="<%=userVO.getUserId()%>">--%>
		 <input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
		
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź��</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������̸�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<%-- <input 	type="text" name="receiverName" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="<%=purchaseVO.getReceiverName()%>" />--%>
			<input 	type="text" name="receiverName" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverName }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">������ ����ó</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<%--<input 	type="text" name="receiverPhone" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="<%=purchaseVO.getReceiverPhone()%>" /> --%>
			<input 	type="text" name="receiverPhone" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverPhone }" />
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<%-- <input 	type="text" name="receiverAddr" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="<%=purchaseVO.getDivyAddr()%>" />--%>
			<input 	type="text" name="divyAddr" class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyAddr }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���ſ�û����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<%--<input 	type="text" name="receiverRequest" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="<%=purchaseVO.getDivyRequest()%>" /> --%>
			<input 	type="text" name="divyRequest" 	class="ct_input_g" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyRequest }" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			
			<!-- jQuery///////////
			<input type="text" readonly="readonly" name="divyDate" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
							onclick="show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value)"/>
			////////// -->
			<input type="text" name="divyDate" value="${purchase.divyDate}" id="datepicker" class="ct_input_g"
						 style="width: 100px; height: 19px" maxLength="10" minLength="6"/> *���� ��� ����� : ${purchase.divyDate}
			
		
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
					<!-- jQuery////////
					<input type="submit" value="����"/>
					///// -->
					����
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- jQuery////////
					<a href="javascript:history.go(-1)">���</a>
					////// -->
					���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>