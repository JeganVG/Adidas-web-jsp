<%@ page import="com.valid.products" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

  String str = request.getParameter("total");
  products p = products.fromJSONString(str);
  
  String url = "jdbc:postgresql://localhost:5432/appranix";
  String username = "postgres";
  String password = "postgres";

  try {
      java.sql.Connection connection = DriverManager.getConnection(url, username, password);
      java.sql.Statement statement = connection.createStatement();
      String sql = "update public.\"products\" set quantity=quantity+1 where name='"+p.getProd_name()+"';";
      statement.executeUpdate(sql);
      session.setAttribute("amount", 0);
	    String sql1 = "select price*quantity as total from public.\"products\";";
	      java.sql.ResultSet resultSet = statement.executeQuery(sql1);
	      int ret_total;
	      while(resultSet.next()){
	    	  ret_total=resultSet.getInt(1);
	    	  session.setAttribute("amount", ret_total+ (Integer) session.getAttribute("amount"));
	      }
      
      response.sendRedirect("Products.jsp");
  }
  catch(Exception e){
  }
%>

</body>
</html>