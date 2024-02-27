<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function redirect(){
		window.location.href="Register.jsp"
	}
</script>
<body>
<center>
<h1>WELCOME !</h1>
<form method="post" action="/adidaswebsite/login">
<table border="|" style="border-spacing:15px;">
<tr><td style="padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px">ENTER YOUR USERNAME : <input type="text" name="username"><br></td></tr>
<tr><td style="padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:10px">ENTER YOUR PASSWORD : <input type="password" name="password"><br></td></tr>
</table><br></br>
<input type="submit" value="SUBMIT">
</form><br></br>
<button onclick="redirect()">REGISTER NOW</button>

</center>
</body>
</html>