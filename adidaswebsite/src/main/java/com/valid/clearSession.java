package com.valid;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/clearSession")
public class clearSession extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("total");
		products p = products.fromJSONString(str);
		HttpSession session = request.getSession();

		String url = "jdbc:postgresql://localhost:5432/appranix";
		String username = "postgres";
		String password = "postgres";

		try {
		    java.sql.Connection connection = DriverManager.getConnection(url, username, password);
		    java.sql.Statement statement = connection.createStatement();
		    String sql = "update public.\"products\" set quantity=0 where name='"+p.getProd_name()+"';";
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

	}
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("total");
		products p = products.fromJSONString(str);
		HttpSession session = request.getSession();

		String url = "jdbc:postgresql://localhost:5432/appranix";
		String username = "postgres";
		String password = "postgres";

		try {
		    java.sql.Connection connection = DriverManager.getConnection(url, username, password);
		    java.sql.Statement statement = connection.createStatement();
		    String sql = "update public.\"products\" set quantity=0;";
		    statement.executeUpdate(sql);
		    session.setAttribute("amount", 0);
		    response.sendRedirect("Products.jsp");
		}
		catch(Exception e){
		}

	}

}
