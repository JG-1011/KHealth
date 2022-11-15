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
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

.board-border {
	border: 1px solid #212529;
	padding: 0%;
	margin-top: 3%;
	margin-bottom: 3%;
	background: #fff;
}

.table {
	border-radius: 0.5rem;
}
</style>
<body class="d-flex flex-column h-100">

	<main class="flex-shrink-0">
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
										<li><input type="button" class="btn btn-link" id="logout"
											style="color: white; text-decoration: none;" value="로그아웃"></li>
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

		<div class="container">
			<div class="row mt-5">
				<h1>QNA 게시판</h1>
				<div class="search ">
					<form action="" style="float: right">
						<div class="input-group">
							<input type=text class="form-control" id=searchTitle
								name=searchTitle placeholder="검색">
							<button class="btn btn-secondary btn-sm" type=button
								id="searchBtn">검색</button>
						</div>
					</form>
					<script>

						$("#searchBtn").on("click", function () {
							
							//$(this).parent().parent().parent().parent().parent().find(".tableSch").find("table").find("tbody").css("display", "none");
					       
							$("#searchResultArea").empty();
					        
							let searchTitle = $("#searchTitle").val();
					
					        $.ajax({
					           url: "/searchAjax.qna?cpage=1",
					           type: "post",
					           data: {
					              "searchTitle": searchTitle
					           },
					           dataType: "json"
					        }).done(function (data) {
					       					            
					       	let result = JSON.parse(data.list);
					        for (let i = 0; i < result.length; i++) {
					      		let tr = $("<tr>");
					            	
					            let tdSeq = $("<td>");
					            tdSeq.append(result[i].qna_seq);
									
					            let tdTitle = $("<td>");
					            tdTitle.append(result[i].qna_title);
					            
					            let tdNickname = $("<td>");
					            tdNickname.append(result[i].qna_nickname);
					
				 	            let tdFormedDate = $("<td>");
				 	           	tdFormedDate.append(result[i].qna_write_date);
					
					            let tdView_count = $("<td>");
					            tdView_count.append(result[i].qna_view_count);
					                
					            tr.append(tdSeq);
					            tr.append(tdTitle);
					            tr.append(tdNickname);
					            tr.append(tdFormedDate);
					            tr.append(tdView_count);
					            $("#searchResultArea").append(tr);
					                
					            
					        }
					      	})
					   })
					   
					</script>
				</div>
			</div>

			<hr class="mb-4">

			<div class="container board-border border-start-0 border-end-0 tableSch">
				<table class="table align-middle mb-0 bg-white">
					<!-- 		<thead class="bg-light"> -->
					<thead class="bg-light">
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>닉네임</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody id="searchResultArea">
						<c:forEach var="i" items="${list }" varStatus="status">
							<tr>
								<td>${i.rn  }</td>

								<td><a href="/detail.qna?qna_seq=${i.qna_seq}">${i.qna_title }&nbsp&nbsp&nbsp[${list1[status.index].numberOfComment}]</a></td>

								<td>${i.qna_nickname }</td>
								<td>${i.formedDate }</td>
								<td>${i.qna_view_count }</td>
								<td>${i.qna_thumbsup}</td>

							</tr>
							
							
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row mb-5">
				<div class="col">
					<button type="button" class="btn btn-secondary"
						style="float: right" id="write">작성하기</button>
				</div>
			</div>
		</div>

		<div class="row mb-5">
			<div style="text-align: center;">${navi }</div>
		</div>



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



		<script>
			console.log("${loginID}");
			console.log(${isInBlacklist});
				$("#write").on("click", function() {
					
					if(${isInBlacklist}){
						alert("회원님은 블랙리스트에 등록되어 게시판 글 작성이 불가능합니다.");
						return;
					}
					else if("${loginID}"==""){
						let loginplz = confirm("로그인 후 이용가능합니다. 로그인페이지로 이동합니다.");
						if(loginplz){
							location.href = "login/LoginDummy.jsp";
						}else{
							return;
						}
					}
					else{
						location.href = "/qna/QnaView.jsp";
					}
					
				})
				
				$("#logout").on("click", function () {
                           location.href = "/logout.mem";
                        })
			</script>

	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>

</body>

</html>