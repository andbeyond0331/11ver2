<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="com.model2.mvc.service.domain.*" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--  �޷� ������ �߰�(jQuery) -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="http://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<title>��ǰ���</title>
	<!--  ///////////////////////// CSS ////////////////////////// -->

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
		fncAddProduct();
	});
});

$(function(){
	$("a[href='#']").on("click",function(){
		$("form")[0].reset();
	});
});
function fncAddProduct(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	

	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	$("form").attr("method", "POST").attr("action","/product/addProduct").attr("enctype", "multipart/form-data").submit();
}



$(function(){
	$($('input:text[name="manuDate"]')).datepicker({
		showOn : "button",
		buttonImage: "../images/ct_icon_date.gif",
		buttonImageOnly: true,
		buttonText: "Select date"
		
	});
	/*
	$("#anim").on("change",function(){
		$($('input:text[name="manuDate"]')).datepicker({
			showAnim:"bounce"
			});
	});
	*/
	$($('input:text[name="manuDate"]')).datepicker( "option", "showAnim", "bounce" );
	$($('input:text[name="manuDate"]')).datepicker( "option", "dateFormat", "yy-mm-dd" );
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
	
		<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		  
		    </div>

		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName1" name="fileName1" placeholder="��ǰ�̹���">
		      
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