<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>사이트명</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  <form action="joinPro.jsp" method="post">
    <div class="form-group">
      <input type="email" class="form-control" id="email" placeholder="이메일" name="email">
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd">
    </div>
    <div class="form-group">
      <input type="name" class="form-control" id="name" placeholder="이름" name="name">
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="birth" placeholder="생년월일(0000-00-00 형식)" name="birth">
    </div>
    <div class="form-group">
      <select class="form-control" id="gender" name="gender">
      	<option value="male" selected>남성</option>
        <option value="female">여성</option>
        <option value="none">선택하지 않음</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">가입하기</button>
  </form>
</div>

</body>
</html>