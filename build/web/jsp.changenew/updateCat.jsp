<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>

<%
   
    
String category=request.getParameter("category");
String cat=request.getParameter("cat");

try{
                            Connection con = new DbConnector().getConnection();
                            Statement stmt = con.createStatement();
                            String query="update category set type='"+category+"' where type='"+cat+"'";
                            String query2="update item set category='"+category+"' where category='"+cat+"'";
                            int a = stmt.executeUpdate(query);   
                            int b = stmt.executeUpdate(query2);
                            if(a>0 || b>0){}
                            
                            }
catch(Exception e){
                            throw new ServletException(e.getMessage());
}
%>
               