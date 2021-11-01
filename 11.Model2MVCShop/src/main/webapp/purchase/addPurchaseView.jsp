<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<title>��ǰ���</title>
	<!--  �޷� ������ �߰�(jQuery) -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
   <!-- ///////////javaScript////////////	 --> 
<script type="text/javascript">
//====����Code �ּ� ó�� �� jQuery ���� =====//

$(function(){
	$("button.btn.btn-primary").on("click",function(){
		fncAddPurchase();
	});
});

$(function(){
	$("a[href='#']").on("click",function(){
		$("form")[0].reset();
	});
});
function fncAddPurchase(){
	
	$("form").attr("method", "POST").attr("action","/purchase/addPurchase").submit();
}



$(function(){
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			$("form")[0].reset();
	});
	
	 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			fncAddPurchase();
	});
	 
	 $($('input:text[name="divyDate"]')).datepicker({
			showOn : "button",
			buttonImage: "../images/ct_icon_date.gif",
			buttonImageOnly: true,
			buttonText: "Select date"
			
		});

		$($('input:text[name="divyDate"]')).datepicker( "option", "showAnim", "bounce" );
		$($('input:text[name="divyDate"]')).datepicker( "option", "dateFormat", "yy-mm-dd" );
});	

</script>

</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">�ų���</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->


<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">��ǰ ����</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }"/>
		
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      	${purchase.purchaseProd.prodNo }
		    </div>
		   </div>
		    
		    <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      	${purchase.purchaseProd.prodName }
		    </div>

		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      	${purchase.purchaseProd.prodDetail }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		     	${purchase.purchaseProd.manuDate }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      	${purchase.purchaseProd.price }
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="buyerId" value=${user.userId }/>
		    	${user.userId }
		      
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�޴� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�޴� �� ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${user.addr }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate">
		    </div>
		  </div>
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	

</body>
</html>
