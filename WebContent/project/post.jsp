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
  <br>
  <h2>게시판 글쓰기</h2>
  <form action="postPro.jsp" method="post">
    <p>제목</p>
    <textarea class="form-control" rows="1" id="comment" name="title"></textarea>
    <br>
    <div class="form-group">
      <label for="comment">내용</label>
      <textarea class="form-control" rows="10" id="comment" name="contents"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">저장하기</button>
  </form>
</div>

</body>
</html>