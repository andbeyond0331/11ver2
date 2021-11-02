<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	.navbar-custom {
		background-color: black;
	}
	.navbar-custom .navbar-brand,
	.navbar-custom .navbar-text{
		color: white;
	}
	.panel-custom{
		background-color: black;
		color: lightgreen;
	}
	.list-group-item-custom{
		color: lightgreen;
	}
	.btn-lg{
		background-color: black;
		color: lightgreen;
	}
	.btn-lg:hover{
		color: #B97FF5;
	}
	.icon-bar{
		background-color: limegreen;
	}
	
	a{
		color: limegreen;
	}
	
	a:hover{
		color: #B97FF5;
		
	}
	
	/* .navbar-custom .navbar-nav .nav-link {
    color: white;
	}
	.navbar-custom .nav-item.active .nav-link,
	.navbar-custom .nav-item:hover .nav-link {
	    color: white;
	} */
	
	.navbar-brand {
		height: auto;
		padding: 5px;
	}
	
	#thumbnail {
		color: blue;
	}
	
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-expand-sm navbar-custom">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#" ><img src="/images/align.png" alt="Logo" height="45"></a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#" class="navbar-custom-collapse">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-custom">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-ice-lolly"></i> 회원관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item list-group-item-custom">
						 	<a href="#">개인정보조회</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-custom">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-ice-lolly"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> 
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-custom">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-ice-lolly"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> 
						  </li>
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a>
						 </li>
					</ul>
				</div>
				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	<!--  myMain -->
	 	 	<div class="row">
			  <div class="col-xs-6 col-md-3">
			    <a href="#" class="thumbnail">
			      <img src="/images/align.png" alt="100%x180" style="height: 200px; width: 100%; display: block; data-holder-rendered="true">
			    </a>
			  </div>
			  <div class="col-xs-6 col-md-3">
			    <a href="#" class="thumbnail">
			      <img src="/images/align.png" alt="100%x180" style="height: 200px; width: 100%; display: block; data-holder-rendered="true">
			    </a>
			  </div>
			  <div class="col-xs-6 col-md-3">
			    <a href="#" class="thumbnail">
			      <img src="/images/align.png" alt="100%x180" style="height: 200px; width: 100%; display: block; data-holder-rendered="true">
			    </a>
			  </div>
			  <div class="col-xs-6 col-md-3">
			    <a href="#" class="thumbnail">
			      <img src="/images/align.png" alt="100%x180" style="color: blue; height: 200px; width: 100%; display: block; data-holder-rendered="true">
			    </a>
			  </div>
			</div>
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>