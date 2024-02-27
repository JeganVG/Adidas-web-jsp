<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTRATION</title>
</head>
<body>
<center>
<h1>REGISTER NOW !</h1>
<table border="|">
<form method="post" action="/adidaswebsite/Register">
<tr style="text-align:center;"><td>ENTER YOUR NAME :</td><td style="padding-top:15px"><input  type="text" name="username"><br></br></td></tr>
<tr style="text-align:center;"><td>ENTER YOUR PASSWORD :</td><td style="padding-top:15px"><input align="middle" type="password" name="password"><br></br></td></tr>
<tr style="text-align:center;"><td>ENTER YOUR AGE :</td><td style="padding-top:15px"><input align="middle" type="number" name="age"><br></br></td></tr>
<tr style="text-align:center;"><td>ENTER YOUR NATIONALITY :</td><td style="padding-top:15px"> <select name="nationality">
    <option value="INDIAN">INDIAN</option>
    <option value="ABROAD">ABROAD</option>
    <option value="OTHERS">OTHERS</option>
  </select><br></br></td></tr>
<tr style="text-align:center;"><td>ENTER YOUR GENDER :</td><td style="padding-top:15px"><select name="gender">
    <option value="MALE">MALE</option>
    <option value="FEMALE">FEMALE</option>
    <option value="PREFER NOT TO DISCLOSE">PREFER NOT TO DISCLOSE</option>
    <option value="OTHERS">OTHERS</option>
  </select><br></br></td></tr>
</table><br></br>
<input type="submit">
</form>
</body>
</html>