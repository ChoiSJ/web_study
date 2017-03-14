<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<h1>파일 리스트</h1>
			<table class="table">
				<thead>
					<tr>
						<th>순번</th>
						<th>파일명</th>
						<th>사이즈</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<%
					// 디렉토리 정보를 가지는 File 객체 생성
					File directory = new File("c:/web_project/repo/");
					
					// 그 디렉토리에 포함된 각각의 파일정보를 담는 File 객체 획득하기
					File[] fileList = directory.listFiles();
					
					for (int i=0; i<fileList.length; i++) {
						File file = fileList[i];
						String filename = file.getName();
						long filesize = file.length();
						Date createDate = new Date(file.lastModified());
				%>
					<tr>
						<td><%=i+1 %></td>
						<td><a href="download?name=<%=filename %>"><%=filename %></a></td>
						<td><%=filesize %></td>
						<td><%=createDate.toLocaleString() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>