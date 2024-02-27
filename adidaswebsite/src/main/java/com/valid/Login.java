package com.valid;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
//@WebServlet("Login")
public class Login extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        
        String given_username = request.getParameter("username");
        String given_password = request.getParameter("password");
        session.setAttribute("username", given_username);
        String url = "jdbc:postgresql://localhost:5432/appranix";
        String username = "postgres";
        String password = "postgres";

        try {
            java.sql.Connection connection = DriverManager.getConnection(url, username, password);
            java.sql.Statement statement = connection.createStatement();

            String sql = "SELECT * FROM public.\"user\" where username='"+given_username+"';";
            java.sql.ResultSet resultSet = statement.executeQuery(sql);

            String ret_username = null;
            String ret_password = null;
            int ret_age = 0;
            String ret_nationality = null;
            String ret_gender = null;
            
            while(resultSet.next()){
            ret_username = resultSet.getString(1);
            ret_password = resultSet.getString(2);
            ret_age = resultSet.getInt(3);
            ret_nationality = resultSet.getString(4);
            ret_gender = resultSet.getString(5);
            
            }

            if(ret_password==null) {
            	response.sendRedirect("/adidaswebsite/html/404.html");
            }
            else if(ret_password.equals(given_password)) {
            	response.sendRedirect("/adidaswebsite/Welcome.jsp");
            }
            else {
            	System.out.println("LOGIN WRONG");
            	response.sendRedirect("/adidaswebsite/html/404.html");
            }
            
        }
        catch(Exception e) {
        	System.out.println(e);
        }
		
	}
}
