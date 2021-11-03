<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<!--  ////////////////////////// -->

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetPurchaseList(currentPage) {
			alert("currentPage : " + currentPage);
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		$(function() {
			 //alert("why? : "+$(  "td:nth-child(7) > i" ).html);
			 // alert("�޾ƿ���?"+$( "td:nth-child(6)" ).data("val"));
			 
				 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "td:nth-child(1)" ).on("click" , function() {
					var tranNo=$("td:nth-child(1)").data("val");
					 self.location ="/purchase/updatePurchase?tranNo="+tranNo;
				});
				
				 $( "td:nth-child(6)" ).on("click", function(){
					var tranNo=$( "td:nth-child(6)" ).data("val");
					alert("arrive tranNo : "+tranNo);
					self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=003";
				 });
			
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			
	
		
		 $( "td:nth-child(2)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				/////////�߰�, ����//////////
				self.location ="/user/getUser?userId="+$(this).data("val");
				///////////////////////////////
				/* var userId = $(this).data("val");
				alert("userId : " +userId);
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h6>"
															+"���̵� : "+JSONData.userId+"<br/>"
															+"��  �� : "+JSONData.userName+"<br/>"
															+"�̸��� : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"����� : "+JSONData.regDateString+"<br/>"
															+"</h6>";
								//Debug...									
								alert(displayValue);
								alert($("td:nth-child(7)" ).html());
								$("h6").remove();
								$("td:nth-child(7)" ).html(displayValue);
							}
					}); */
					

			});
		 });
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(7) > i" ).on("click" , function() {
					
				

					var tranNo = $(this).find("#tranNo").val();
					
					$.ajax( 
							{
								url : "/purchase/json/getPurchase/"+tranNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
										+"�ֹ���ȣ : "+JSONData.tranNo+"<br/>"
										+"������ ���̵� : "+JSONData.userId+"<br/>"
										+"���� ��� : "+JSONData.paymentOption+"<br/>"
										+"�޴� ��� : "+JSONData.receiverName+"<br/>"
										+"����ó : "+JSONData.receiverPhone+"<br/>"
										+"����� : "+JSONData.divyAddr+"<br/>"
										+"��û���� : "+JSONData.divyRequest+"<br/>"
										+"��������¥ : "+JSONData.divyDateString+"<br/>"
										+"�ֹ���¥ : "+JSONData.orderDate+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+tranNo+"" ).html(displayValue);
								}
						});
						
			});
			
			//==> prodName LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(1)" ).css("background-color" , "black");
			$( "td:nth-child(2)" ).css("background-color" , "black");
			$( "td:nth-child(3)" ).css("background-color" , "black");
			$( "td:nth-child(4)" ).css("background-color" , "black");
			$( "td:nth-child(5)" ).css("background-color" , "black");
			$( "td:nth-child(6)" ).css("background-color" , "black");
			$( "td:nth-child(7)" ).css("background-color" , "black");
			
			$( "td:nth-child(1)" ).css("color" , "lightgreen");
			$( "td:nth-child(2)" ).css("color" , "lightgreen");
			$( "td:nth-child(3)" ).css("color" , "lightgreen");
			$( "td:nth-child(4)" ).css("color" , "lightgreen");
			$( "td:nth-child(5)" ).css("color" , "lightgreen");
			$( "td:nth-child(6)" ).css("color" , "lightgreen");
			$( "td:nth-child(7)" ).css("color" , "lightgreen");
			$("h7").css("color" , "lightgreen");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
			���� ��� ��ȸ
			
	       
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>

	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ��ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center" data-val="${purchase.tranNo }">${ i }</td>
			  <td align="left" data-val="${user.userId }">${user.userId }</td>
			 
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">����
			  	<c:choose>
				<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '002' }">
					���� �Ϸ�
				</c:when>
				<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '003' }">
					��� ��
				</c:when>
				<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '000' }">
					��� �Ϸ�
				</c:when>
				<c:otherwise> �Ǹ� ��</c:otherwise>
				</c:choose>
				�����Դϴ�.
			  </td>
			  <td align="left" data-val="${purchase.tranNo }">
			  	<c:choose>
					<c:when test="${! empty purchase.tranCode }">
						<c:if test="${purchase.tranCode eq '003' }">
							<!-- //////////jQuery /////////////////
							<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=003" onClick="return confirm('�ش� ��ǰ�� �����ϼ̽��ϱ�?')">���ǵ���</a>
							////////////////////////////-->
							<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
							���� ����
						</c:if>
					</c:when>
				</c:choose>
			  </td>
			  <td align="left" data-userId="${user.userId }">
			  	<i class="glyphicon glyphicon-ok" id= "${purchase.tranNo}">
			  	<input type="hidden" id="tranNo" value="${purchase.tranNo}">
				</i>
				
			  </td>
			  </tr>
		
        	
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new3.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
