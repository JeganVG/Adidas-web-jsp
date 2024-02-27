<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="com.valid.products" %>
<%@ page import="org.bson.Document" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BILLING HISTORY</title>
<style>
  .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 30px;
  }
</style>
</head>
<body>

<%
String connectionString = "mongodb://localhost:27017";
ArrayList<products> arr = new ArrayList();
arr = (ArrayList<products>) session.getAttribute("list_prod");

try (MongoClient mongoClient = MongoClients.create(connectionString)) {
    // Connect to database
    MongoDatabase database = mongoClient.getDatabase("appranix");

    // Get reference to collection
    MongoCollection<Document> collection = database.getCollection("billing");
    
    String name = (String) session.getAttribute("username");
    Document query = new Document("name", name);
    FindIterable<Document> findIterable = collection.find(query);

    // Iterate over the documents
    MongoCursor<Document> cursor = findIterable.iterator();
    %>
    <center>
    <h1>BILLING HISTORY</h1>
    </center>
    <div class="container">
    <% while (cursor.hasNext()) { Document document = cursor.next();%>
    <table border="|" style="overflow: word-wrap;">
    <tr><th>TOTAL AMOUNT</th><td><P><%= document.getInteger("total") %></P></tr>
    <tr><th>DATE</th><td><P><%= document.getDate("timestamp") %></P></tr>
    </table>
    <% 
    }
    %>
    </div>
    <br></br>
    <form action="/adidaswebsite/Products.jsp"><input value="back" type="submit"></form>
    <form action="/adidaswebsite/Welcome.jsp"><input value="home" type="submit"></form>
<%
    System.out.println("Document inserted successfully");
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
}
%>
</body>
</html>
