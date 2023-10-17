<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>留言本</title>
	<style type="text/css">
		body {
			background-color: white;
			color: black;
			font-weight: bold;
		}

		.center-in-center {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}

		.form-container {
			width: 300px;
			padding: 20px;
			background-color: rgba(0, 0, 0, 0.5);
			border-radius: 10px;
		}

		.form-container label {
			display: block;
			margin-bottom: 10px;
		}

		.form-container input[type="text"],
		.form-container input[type="password"] {
			width: 100%;
			height: 30px;
			margin-bottom: 10px;
			padding: 5px;
			font-size: 14px;
			border: none;
			border-radius: 5px;
		}

		.form-container input[type="submit"],
		.form-container input[type="reset"] {
			width: 75px;
			height: 30px;
			margin-top: 10px;
			background-color: #4CAF50;
			color: white;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}

		.form-container input[type="submit"]:hover,
		.form-container input[type="reset"]:hover {
			background-color: #45a049;
		}

		.form-container p {
			margin-top: 10px;
		}

	</style>

</head>

<body>

<div align="center" class="center-in-center">

	<h1>请完善您的相关信息：</h1>
	<div class="form-container">
		<form action="RegistServlet" method="post">

			<input type="hidden" name="action" value="regist"><br>

			<label>用户名:</label>
			<input type="text" name="username" required><br>

			<label>密码:</label>
			<input type="password" name="password" required><br>

			<label>确认密码:</label>
			<input type="password" name="password2" required>
			<p>${message}</p>
			<input type="submit" name="regist" value="注册">
			<input type="reset" value="重置">
		</form>
	</div>

</div>
</body>

</html>
