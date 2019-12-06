<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%
String name=request.getParameter("name");
String itid=request.getParameter("itid");

try{
                            Connection con = new DbConnector().getConnection();
                            Statement stmt = con.createStatement();
                            String query="update item set itemName='"+name+"' where itemID='"+itid+"'";
                            int a = stmt.executeUpdate(query);                          
                            if(a>0){
                            
                            
                            }}
catch(Exception e){
                            throw new ServletException(e.getMessage());
                        }

%>