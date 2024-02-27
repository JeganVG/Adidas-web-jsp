<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />
    <title>adidaswebsite</title>
  </head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	HttpSession sess = request.getSession();
	if(sess.getAttribute("username")==null) response.sendRedirect("login.jsp");
	else {
		String username = (String) sess.getAttribute("username");
		
	}
%>
  <body>
    <header>
      <div class="container">
        <div class="navbar">
          <div class="logo">
            <img style="height:60px;width:60px;object-fit:contain;"src="/adidaswebsite/assets/logo.png" alt="" />
          </div>
          <nav>
            <div class="btn">
              <i class="fa fa-times close-btn"></i>
            </div>
            <li ><a style="color: #000000" href="/adidaswebsite/Welcome.jsp">Home</a></li>
            <li><a style="color: #000000"href="/adidaswebsite/AboutUs.jsp">About</a></li>
            <li><a style="color: #000000"href="/adidaswebsite/Products.jsp">Products</a></li>
            <li><a style="color: #000000"href="/adidaswebsite/Profile.jsp">Profile</a></li>
            <li><a style="color: #000000" href="/adidaswebsite/logout">LogOut</a></li>
          </nav>
          <div class="btn">
            <i class="fa fa-bars menu-btn"></i>
          </div>
        </div>
      </div>
    </header>
    <section>
      <video autoplay muted loop>
        <source src="/adidaswebsite/assets/video2.mp4" type="video/mp4" />
      </video>
<div class="container">
        <div class="content">
          <h2>Chase Your Dream</h2>
          <h2>with Adidas</h2>
          <h2>${username}</h2>
          <p>
            	All In or Nothing
          </p>
          <button>Explore More</button>
          <div class="social_icons">
            <i class="fa fa-brands fa-facebook"></i>
            <i class="fa fa-brands fa-twitter"></i>
            <i class="fa fa-brands fa-instagram"></i>
            <i class="fa fa-brands fa-pinterest"></i>
          </div>
        </div>
      </div>
    </section>
    <script src="adidaswebsite/src/main/js/script.js"></script>
  </body>
</html>
</body>
</html>