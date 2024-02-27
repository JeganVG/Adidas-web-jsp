package com.valid;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
//@WebServlet("/Register")
public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String given_username = request.getParameter("username");
    	String given_password = request.getParameter("password");
    	int given_age = Integer.parseInt(request.getParameter("age"));
    	String given_nationality = request.getParameter("nationality");
    	String given_gender = request.getParameter("gender");
    	
    	PrintWriter out = response.getWriter();
    	String url = "jdbc:postgresql://localhost:5432/appranix";
        String username = "postgres";
        String password = "postgres";

        try {
            java.sql.Connection connection = DriverManager.getConnection(url, username, password);
            java.sql.Statement statement = connection.createStatement();

            String sql = "INSERT INTO public.\"user\" VALUES ('"+given_username+"','"+given_password+"',"+given_age+",'"+given_nationality+"','"+given_gender+"')";
            statement.executeUpdate(sql);
            response.sendRedirect("/adidaswebsite/login.jsp");
    }
        catch (SQLException e) {
            e.printStackTrace();

        }
	}


}
