<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
                        String firstname=request.getParameter("firstname");
                        String lastname=request.getParameter("lastname");
                       String gender=request.getParameter("Gender");
                       String tel=request.getParameter("tel");
                        String username=request.getParameter("username");
                        String password=request.getParameter("password");
                       
                        
                        try{
                            Connection con = new DbConnector().getConnection();
                            Statement stmt = con.createStatement();
                            String query="INSERT INTO userdetails(firstname,lastname,gender,username,password,tel) VALUES('"+firstname+"','"+lastname+"','"+gender+"','"+username+"','"+password+"','"+tel+"')";
                            int a = stmt.executeUpdate(query);                          
                            if(a>0){
                                   
                       
                              out.println("<script type='text/javascript'>alert('successfully register');window.location.href='index.jsp'</script>"); 
                            }
                            else{
                      out.println("<script type='text/javascript'>alert('successfully  not register');</script>"); 
                            }
                        }
                        catch(Exception e){
                            throw new ServletException(e.getMessage());
                        }
                        %>