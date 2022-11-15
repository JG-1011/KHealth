<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>K-Health</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js">

      </script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 결제모듈 API -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>

<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<form id="buyFrm" method="post">
			<!-- Navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark position: fixed; top: 0px;">
				<div class="container px-5 " id="sticky-wrapper"
					class="sticky-wrapper">
					<a class="navbar-brand" href="/index.jsp"><img
						src="/image/khealth logo.png" height="100px"></a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<c:choose>
						<c:when test="${loginID != null}">
							<!-- 로그인을 한 사용자 -->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
									<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.tips?cpage=1">Tips</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.market?cpage=1">Market</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.qna?cpage=1">Q&A</a></li>


									<!-- dropdown -->
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" style="color: white" href="#"
										role="button" data-bs-toggle="dropdown" aria-expanded="false">
											${loginID }님 </a>
										<ul class="dropdown-menu dropdown-menu-dark">
											<li class="dropdown-item"><a href="/mypage.mem"
												style="color: white; text-decoration: none;">Mypage</a></li>
											<li><a class="dropdown-item" style="color: white;"
												href="#">장바구니</a></li>
											<li><a class="dropdown-item" style="color: white;"
												href="#">뭐 넣지</a></li>
											<li>
												<hr class="dropdown-divider">
											</li>
											<li><input type="button" class="btn btn-link"
												id="logout" style="color: white; text-decoration: none;"
												value="로그아웃"></li>
										</ul></li>
								</ul>
							</div>

						</c:when>
						<c:when test="${loginID == null}">
							<!-- 로그인을 안한 사용자 -->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
									<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.tips?cpage=1">Tips</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.market?cpage=1">Market</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/list.qna?cpage=1">Q&A</a></li>
									<li class="nav-item"><a class="nav-link"
										href="login/LoginDummy.jsp">Login</a></li>
									<li class="nav-item"><a class="nav-link"
										href="login/SigninDummy.jsp">Signin</a></li>
									<li></li>
								</ul>
							</div>
						</c:when>
					</c:choose>
				</div>
			</nav>


			<!-- Product section-->
			<input type="hidden" value="${dto.product_seq }"
				name="product_seqForWishlist"> <input type="hidden"
				value="${dto.product_name }" name="product_nameForWishlist">
			<input type="hidden" value="${dto.product_price }"
				name="product_priceForWishlist">
			<section class="py-5">
				<div class="container px-4 px-lg-5 my-5">
					<div class="row gx-4 gx-lg-5 align-items-center">
						<div class="col-md-6">
							<img class="card-img-top mb-5 mb-md-0" src="/image/${oriName }"
								alt="..." />
						</div>

						<div class="col-md-6">
							<div class="small mb-1">SKU: BST-498</div>
							<h1 class="display-5 fw-bolder">${dto.product_name }</h1>
							<div class="fs-5 mb-5">
								<span>${dto.product_price } 원</span>
							</div>
							<p class="lead">${dto.product_explain }</p>
							<div>

								<div class="row mb-2">
									<div class="col">
										<input type="number" name="amount" id="amount"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											style="max-width: 3rem" value="1" min="0">



										<button class="btn btn-outline-dark flex-shrink-0 me-1"
											type="button" onClick="javascript:this.form.amount.value++;">
											<i class="bi bi-plus-lg"></i>
										</button>

										<button class="btn btn-outline-dark flex-shrink-0 me-1"
											type="button"
											onClick="javascript:isUnderZero();this.form.amount.value--;">
											<i class="bi bi-dash-lg"></i>
										</button>
									</div>
								</div>

								<div class="row">
									<div class="col">
										<input type="button"
											class="btn btn-outline-dark flex-shrink-0" id="buy"
											value="구매하기">
										<button class="btn btn-outline-dark flex-shrink-0 me-1"
											type="button" id="addwishlist">
											<i class="bi-cart-fill"></i> 장바구니
										</button>





									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>

		<!-- review section -->


		<form action="" id="reviewFrm" method="post">
			<section class="py-5">
				<div class="row d-flex justify-content-center px-md-5 mx-md-5">
					<div class="container px-4 px-lg-5 my-5">
						<div class="card shadow-0 border"
							style="background-color: #f0f2f5;">
							<div class="card-body p-4">
								<div class="form-outline mb-4">

									<input type=hidden value="${dto.product_name }"
										name="product_name"> <input type=hidden
										value="${dto.product_seq }" name="product_seq"> <input
										type="text" id="addANote" name="productreview_contents"
										class="form-control mb-2" placeholder="Type comment..." />
								

									<div class="row mb-5 ">
										<div class="col">
											<button type=button class="insertReview" id="insertReview"
											style="float: right">리뷰작성</button>
										</div>
										
										
									</div>


								</div>





								<div class="card mb-4">
									<div class="card-body">
										<c:forEach var="list" items="${list }">
											<div class="card mb-4">
												<div class="card-body">
													<p>${list.pr_contents }</p>

													<div class="d-flex justify-content-between">
														<div class="d-flex flex-row align-items-center">

															<p class="small mb-0 ms-2">${list.pr_writer }</p>
														</div>
														<div class="d-flex flex-row align-items-center">
															<p class="small text-muted mb-0">Upvote?</p>
															<i class="far fa-thumbs-up mx-2 fa-xs text-black"
																style="margin-top: -0.16rem;"></i>
															<p class="small text-muted mb-0">3</p>
														</div>
													</div>
												</div>
											</div>

										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
	</main>










	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto ">
		<div class="container px-5 ">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row ">
				<div class="text-center">
					<div class="small m-0 text-white">대표자 : 임근혁 | 담당자 : 윤성민 | 책임자
						: 유한호 | 관리자 : 이진혁 | 개발자 : 이승택 | 총관리 : 권준구</div>
					<div class="small m-0 text-white"></div>
					<div class="small m-0 text-white">케이헬스 주식회사
						(www.k-health.com) | 사업자등록번호 : 851-12-34567</div>
					<div class="small m-0 text-white">Copyright &copy; K-Health
						Corp. All rights reserved.</div>
					<div class="small m-0 text-white">서울특별시 중구 남대문로 120 대일빌딩 3층</div>

					<img src="/image/instagram.png" height="20px"> <span
						class="text-white mx-1">&middot;</span> <img
						src="/image/facebook.png" height="20px"> <span
						class="text-white mx-1">&middot;</span> <img
						src="/image/youtube.png" height="20px"> <span
						class="/image/text-white mx-1">&middot;</span> <img
						src="/image/twitter.png" height="20px">
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
	<script>
        $("#insertReview").on("click", function () {
        	
            if ("${loginID }" == "") {
                let loginplz = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동합니다.");
                if (loginplz) {
                  location.href = "/login/LoginDummy.jsp";
                } else {
                  return;
                }

              }
              else {

                  $("#reviewFrm").attr("action", "/insert.review?cpage=1")
                  $("#reviewFrm").submit();

              }

        })

        $("#addwishlist").on("click", function () {
          if ("${loginID }" == "") {
            let loginplz = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동합니다.");
            if (loginplz) {
            	location.href = "/login/LoginDummy.jsp";
            	
            }

            else {
              return;
            }

          }else if($("#amount").val()<1){
      		alert("수량을 확인해주세요.");
    		return false;
    	} 
        else {
        	
        	let wantadd = confirm("상품을 장바구니에 추가하시겠습니까?");
        	if(wantadd){
        		
        		addwishajax();
//         		$("#buyFrm").attr("action", "/add.wish");
//                 $("#buyFrm").submit();
        	}
            

          }

        })

        $("#buy").on("click", function () {

          if ("${loginID }" == "") {
            let loginplz = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동합니다.");
            if (loginplz) {
              location.href = "/login/LoginDummy.jsp";
            }
            else {
              return;
            }

          }
          else if($("#amount").val()==""){
      		alert("수량을 확인해주세요.");
      		return false;
      	}          
          else {
            $("#buyFrm").attr("action", "/item.buy?product_seq=" + ${ dto.product_seq } + "");
            $("#buyFrm").submit();
          }
        })
        
		function isUnderZero(){
        	if($("#amount").val()<1){
        		alert("수량을 확인해주세요.");
        		$("#amount").val()=2;
        	}else{
        		return;
        	}
        	
        }
        
        $("#logout").on("click", function () {
        	console.log("${loginID}");
            //location.href = "/logout.mem";
         })
        
        function addwishajax(){
        	
        	$.ajax({
        		url:"/addwish.ajax",
        		data:{
        			"amount": $("#amount").val(),
        			"product_seq": "${ dto.product_seq }",
        			"oriName":"${oriName}",
        			"name":"${dto.product_name}",
        			"price":"${dto.product_price}"
        		},
        		success : function(resp) {
        			let wantToGoWishlist = confirm("상품이 장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
        			if(wantToGoWishlist){
        				location.href="/list.wish?cpage=1";
        			}
        			
        		},
        		error : function(resp) {
					alert("에러 발생!");
				},
        		
        	})
        }

      </script>

</body>

</html>