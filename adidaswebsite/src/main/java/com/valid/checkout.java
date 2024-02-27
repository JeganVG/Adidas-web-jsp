package com.valid;
import org.slf4j.Logger;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

//@WebServlet("/checkout")
public class checkout extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger logger = LoggerFactory.getLogger(checkout.class);
		  logger.debug("Debug log message");
	      logger.info("Info log message");
	      logger.error("Error log message");
		HttpSession session = request.getSession();
		logger.info(session.getAttribute("username")+"clicked checkout");
		
		String connectionString = "mongodb://localhost:27017";
		ArrayList<products> arr = new ArrayList();
		arr = (ArrayList<products>) session.getAttribute("list_prod");
		
		try (MongoClient mongoClient = MongoClients.create(connectionString)) {
            // Connect to database
            MongoDatabase database = mongoClient.getDatabase("appranix");

            // Get reference to collection
            MongoCollection<Document> collection = database.getCollection("billing");
            if((Integer)session.getAttribute("amount")!=0) {
            // Create a nested document
            Document mainDocument = new Document("name", session.getAttribute("username"))
                                        .append("total", (Integer) session.getAttribute("amount"))
                                        .append("timestamp", new Date());
            for(products p : arr) {
            	if(p.getProd_quantity()!=0) {
            	Document nestedDocument = new Document("item price", p.getProd_price())
            	        .append("item quantity", (Integer) p.getProd_quantity());
            	mainDocument.append(p.getProd_name(), nestedDocument);}
    		}
            collection.insertOne(mainDocument);
            }
          

            // Insert the main document into the collection

            response.sendRedirect("Purchase.jsp");
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
		

		
	}

}
