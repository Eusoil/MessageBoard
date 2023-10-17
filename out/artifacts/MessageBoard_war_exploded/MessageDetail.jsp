<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,javaBean.*,useBean.*"
		 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>留言本</title>
	<style type="text/css">
		body {
			background-color: white;
			color: black;
			font-weight: bold;
		}

		html {
			height:100%;
			weight:100%;
		}

		h1, h2, h3 {
			color: black;
		}

		.comment-container {
			margin-top: 20px;
		}

		.comment {
			margin-bottom: 10px;
			border: 1px solid #ccc;
			padding: 10px;
			border-radius: 5px;
		}

		.comment p {
			margin: 0;
		}

		.comment-header {
			margin-bottom: 5px;
		}

		.comment-user {
			font-weight: bold;
		}

		.comment-time {
			font-style: italic;
			color: #777;
		}

		.comment-textarea {
			margin-top: 10px;
		}

		.comment-textarea textarea {
			width: 100%;
			height: 80px;
			padding: 5px;
			font-size: 14px;
			border: 1px solid #ccc;
			border-radius: 5px;
		}

		.comment-textarea input[type="submit"] {
			margin-top: 5px;
			background-color: #4CAF50;
			color: white;
			border: none;
			border-radius: 5px;
			padding: 5px 10px;
			cursor: pointer;
		}

		.comment-textarea input[type="submit"]:hover {
			background-color: #45a049;
		}
	</style>
</head>

<body>
<%
	String mid ="";
	mid= request.getParameter("mid");
	Message message = new Message();
	message = MessageDB.selectMessagem(mid);
%>

<h1>主题： <%= message.gettitle() %></h1>
<h2>内容：</h2>
<p><%= message.getcontext() %></p>

<h3>评论：</h3>
<div class="comment-container">
	<%
		ArrayList mL=(ArrayList)request.getAttribute("DetailList");
	%>

	<% if (mL != null){
		for (int i = 0; i < mL.size(); ++i ){
			Detail detail = (Detail)mL.get(i);

			if(detail.getmid().equals(mid)){
	%>
	<div class="comment">
		<div class="comment-header">
			<p class="comment-user">用户: <%= detail.getcuser() %></p>
			<p class="comment-time">时间: <%= detail.getctime() %></p>
		</div>
		<p class="comment-content">评论：<%= detail.getcomment() %></p>
	</div>
	<%	}} }%>
</div>

<form action="LeaveDetailServlet" method="post" class="comment-textarea">
	<input type="hidden" name="action" value="leave">
	<p>提交留言，查看评论：</p>
	<textarea name="comment" cols="60" rows="4" required></textarea><br>
	<input type="hidden" name="mid" value="<%= mid %>">
	<input type="submit" value="提交评论">
</form>

</body>
</html>
