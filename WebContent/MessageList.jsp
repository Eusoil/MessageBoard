<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,javaBean.Message"
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

		.container {
			margin-top: 50px;
		}

		h1 {
			margin-bottom: 20px;
		}

		table {
			width: 800px;
			border-collapse: collapse;
		}

		th, td {
			padding: 10px;
			border: 1px solid #ccc;
		}

		th {
			background-color: #f2f2f2;
			font-weight: bold;
		}

		a.button {
			display: inline-block;
			padding: 10px 20px;
			border: 1px solid #ccc;
			border-radius: 5px;
			text-decoration: none;
			color: black;
			background-color: #f2f2f2;
			font-weight: bold;
			transition: background-color 0.3s ease;
		}

		a.button:hover {
			background-color: #ddd;
		}
	</style>
</head>

<body>
<div align="center" class="container">
	<h1>欢迎来到留言系统</h1>

	<table>
		<%
			ArrayList mL=(ArrayList)request.getAttribute("MessageList");
		%>
		<tr>
			<th>留言数</th>
			<th>标题</th>
			<th>留言内容</th>
			<th>用户ID</th>
		</tr>
		<% if (mL != null){
			for (int i = 0; i < mL.size(); ++i ){
				Message message = (Message)mL.get(i);%>
		<tr>
			<td><%= message.getmid() %></td>
			<td><a href="MessageDetail.jsp?mid=<%= message.getmid() %>"><%= message.gettitle() %></a></td>
			<td><%= message.getcontext() %></td>
			<td><%= message.getuserid() %></td>
		</tr>
		<%	} } %>

	</table>
	<a href="LeaveMessage.jsp" class="button">我要留言</a>
</div>
</body>
</html>
