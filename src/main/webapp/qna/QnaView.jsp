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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<!-- 써머노트 임포트 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<style>
/* .container {border 1px solid balck; */

/* } */
.board-border {
	border: 1px solid #212529;
	padding: 0%;
	margin-top: 3%;
	margin-bottom: 3%;
	border-radius: 0.5rem;
	background: #fff;
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
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="">Intro</a></li>
						<li class="nav-item"><a class="nav-link" href="">Contact</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/list.tips?cpage=1">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/list.qna?cpage=1">Q&A</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/login/LoginDummy.jsp">Login</a></li>
					</ul>
				</div>
			</div>
		</nav>





		<form action="/write.qna" method="post">
			<div class="container board-border px-3">
				<div class="row">
					<div class="col-5 mt-4 mb-5">
						<h1>게시판 글쓰기</h1>
					</div>
					<div class="col-5 mt-4 mb-5 ">
						<button type="submit" class="btn btn-secondary" id="write">글쓰기</button>
						<button type="button" class="btn btn-secondary" id="back">목록으로</button>
					</div>
				</div>

				<div class="row">
					<select class="form-select" aria-label="Default select example">
						<option selected>Open this select menu</option>
						<option value="1">한호</option>
						<option value="2">화</option>
						<option value="3">이</option>
						<option value="4">팅</option>
					</select>
				</div>




				<div class="form-group row">
					<div class="col-sm">
						<input type="text" id="qna_title" class="form-control-plaintext"
							name="qna_title" placeholder="제목을 입력하세요."> <input
							type="hidden" id="qna_write_date" name="qna_write_date">
					</div>
				</div>
				<div class="form-group">
					<form>
						<input type=file>
					</form>
					<textarea class="form-control" name="qna_contents"
						id="qna_contents" id="exampleFormControlTextarea1" rows="10"
						placeholder="내용을 입력하세요.">
               </textarea>
					<!-- <input type = file multiple name = "file"><br> -->
				</div>

			</div>
		</form>


		<script>
			$("#back").on("click", function() {
				location.href = "QnaDummy.jsp"
			})
			//서머노트 
			$('#qna_contents')
					.summernote(
							{
								callbacks : {
									onImageUpload : function(files, editor) {
										//에디터 이미지 업로드 기능
										console.log(files);

										var data = new FormData();
										// 
										data.append('imgFile', files[0]);
										$.ajax({
											url : 'upload.file',
											type : 'post',
											data : data,
											enctype : 'multipart/form-data',
											contentType : false, // 
											processData : false
										// 
										}).done(
												function(resp) {

													var imgNode = $("<img>");
													imgNode.attr("src", resp);

													$(".note-editable").append(
															imgNode);
												}).fail(function(a, b, c) {
											console.log(a);
											console.log(b);
											console.log(c);
										});
									}
								},

								placeholder : '내용을 입력하세요.',
								tabsize : 2,
								height : 400,
								toolbar : [
										[ 'style', [ 'style' ] ],
										[
												'font',
												[ 'bold', 'undeerline', 'clear' ] ],
										[ 'color', [ 'color' ] ],
										[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
										[ 'table', [ 'table' ] ],
										[ 'insert',
												[ 'link', 'picture', 'video' ] ],
										[
												'view',
												[ 'fullscreen', 'codeview',
														'help' ] ] ]
							});
		</script>








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

</body>
</html>