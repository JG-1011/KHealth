<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
			integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
			crossorigin="anonymous"></script>
		<script>
  Kakao.init('2644b324a18137f288c55737e196f4ac'); // ����Ϸ��� ���� JavaScript Ű �Է�
</script>

<script>



requestUserInfo();

function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }
  

</script>
</body>
</html>