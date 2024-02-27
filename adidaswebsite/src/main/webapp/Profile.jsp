	<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%
	HttpSession sess = request.getSession();
	if(sess.getAttribute("username")==null) response.sendRedirect("login.jsp");
	else {
		String user1 = (String) sess.getAttribute("username");
		
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome ${username}</title>
</head>
<body>
<%
    PrintWriter outr = response.getWriter();
    
    String user1 = (String) sess.getAttribute("username");
    String url = "jdbc:postgresql://localhost:5432/appranix";
    String username = "postgres";
    String password = "postgres";
    String ret_username = null;
    String ret_password = null;
    int ret_age = 0;
    String ret_nationality = null;
    String ret_gender = null;

    try {
        java.sql.Connection connection = DriverManager.getConnection(url, username, password);
        java.sql.Statement statement = connection.createStatement();

        String sql = "SELECT * FROM public.\"user\" where username='"+user1+"';";
        java.sql.ResultSet resultSet = statement.executeQuery(sql);

        while(resultSet.next()){
        ret_username = resultSet.getString(1);
        ret_password = resultSet.getString(2);
        ret_age = resultSet.getInt(3);
        ret_nationality = resultSet.getString(4);
        ret_gender = resultSet.getString(5);

        }
        sess.setAttribute("name", ret_username);
        sess.setAttribute("age", ret_age);
        sess.setAttribute("nationality",ret_nationality);
        sess.setAttribute("gender",ret_gender);
        
    }
    catch(Exception e) {
    	System.out.println(e);
    }
    String nationality = (String) sess.getAttribute("nationality");
    int age = (int) sess.getAttribute("age");
    String gender = (String) sess.getAttribute("gender");
    
%>
<center>
<h1>hello</h1>
<table border="|">
	<tr><th>NAME :</th><th><h2>${username}</h2></th></tr>
	<tr><th>AGE :</th><th><h2>${age}</h2></th></tr>
	<tr><th>NATIONALTIY :</th><th><h2>${nationality}</h2></th></tr>
	<tr><th>GENDER :</th><th><h2>${gender}</h2></th></tr>
</table>
<br></br>
<button><a style="color: #000000" href="./Welcome.jsp">Home</a></button>
</center>

</body>
</html>