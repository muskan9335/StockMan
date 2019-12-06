<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");
        Statement stmt=con.createStatement();
        String query="SELECT * FROM userdetails WHERE username='"+username+"' AND password='"+password+"'";
        ResultSet rs = stmt.executeQuery(query);
        
        if(rs.next()){
        session.setAttribute("uname", rs.getString("username"));
        session.setAttribute("userID", rs.getString("userID"));
    
        %>true<%
        }
        else{
            %>false<%
        }
        
                
    }catch(Exception e){
        
  throw new ServletException(e.getMessage());
    }
          
    %>
