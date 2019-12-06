<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String category = request.getParameter("catName");

    
   
    try {
        
        Connection con = new DbConnector().getConnection();
        Statement stmt = con.createStatement();        
        String query = "INSERT INTO category(type) values('" + category + "')";
        int a = stmt.executeUpdate(query);
        if (a > 0) {
            response.sendRedirect("../intronew.jsp");
        } else {
%>
Error occurred. Try again.
<%
        }
    } catch (Exception e) {
        throw new ServletException(e.getMessage());
    }

%>