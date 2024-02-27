<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.valid.products" %>
    <%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
    <%
    // Initialize session variable if not already set
    if (session.getAttribute("amount") == null) {
        session.setAttribute("amount", 0);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCTS</title>
</head>
<body>

<%

response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	HttpSession sess = request.getSession();
	if(sess.getAttribute("username")==null) response.sendRedirect("login.jsp");
	
	String user1 = (String) sess.getAttribute("username");
    String url = "jdbc:postgresql://localhost:5432/appranix";
    String username = "postgres";
    String password = "postgres";
    String ret_product = null;
    String ret_description = null;
    int ret_price = 0;
    int ret_quantity = 0;
    ArrayList<products> arr_prod = new ArrayList<>();
    ArrayList<String> arr_name = new ArrayList<String>();
    ArrayList<Integer> arr_price = new ArrayList<Integer>();
    ArrayList<String> arr_description = new ArrayList<String>();
    ArrayList<Integer> arr_quantity = new ArrayList<Integer>();
    
    try {
        java.sql.Connection connection = DriverManager.getConnection(url, username, password);
        java.sql.Statement statement = connection.createStatement();

        String sql = "SELECT * FROM products ORDER BY name;";
        java.sql.ResultSet resultSet = statement.executeQuery(sql);

        while(resultSet.next()){
        	
        ret_product = resultSet.getString(1);
        ret_price = resultSet.getInt(2);
        ret_description = resultSet.getString(3);
        ret_quantity = resultSet.getInt(4);
        
        arr_prod.add(new products(ret_product, ret_price, ret_description, ret_quantity));
        
        }
        request.setAttribute("list_prod", arr_prod);
        session.setAttribute("list_prod", arr_prod);
        for (products p : arr_prod){
        System.out.println(p.getProd_name());}
     
    }
    catch(Exception e) {
    	System.out.println(e);
    }
    %>
    <center>
    <h1>PRODUCTS</h1>
    <h2>TOTAL AMOUNT IS :<%=session.getAttribute("amount")%></h2></center>
    </center>
    <div style="display:flex;flex-wrap:wrap;justify-content: space-between;gap: 5px;">
    <% for(products s : arr_prod){ String jsonString = s.toJSONString();%>
    <table border="|" style="overflow:word-wrap;">
    <tr><th>PRODUCT NAME : </th><td><P><%= s.getProd_name() %></P></tr>
    <tr><th style="width:220px">PRODUCT DESCRIPTION : </th><td style="width:200px"><p><%= s.getProd_description() %></p></tr>
    <tr><th>PRODUCT PRICE : </th><td><p>$<%= s.getProd_price() %></p></tr>
    <tr><th>PRODUCT QUANTITY : </th><td><p><%= s.getProd_quantity() %><p></tr><br></br>
    <tr style="border:none";><td colspan="2"><center><form action="updatesession.jsp" method="post"><input type="hidden" name="total" value=<%=jsonString%>><input type="submit" value="ADD"></button></form></center></td></tr>
    <tr style="border:none"	><td colspan="2"><center><form action="http://localhost:8081/adidaswebsite/clearSession" method="get" ><input type="hidden" name="total" value=<%=jsonString%>><input value="clear" type="submit"></button></form></center></td></tr>
    </table>
    
    <%} %>
    </div>
    <br></br>
    <form action="http://localhost:8081/adidaswebsite/Welcome.jsp"><input value="home" type="submit"></form>
    <center><form action="http://localhost:8081/adidaswebsite/clearSession" method="post" ><input value="clear all" type="submit"></button></form></center>
    <center><form action="http://localhost:8081/adidaswebsite/checkout"><input value="Checkout" type="submit"></form></center>
</body>

</html>