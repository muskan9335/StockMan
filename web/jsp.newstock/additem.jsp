<%@page import="my.classes.ItemCart"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="my.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.*"%>
<%@page import="my.classes.ItemCart" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  if (session.getAttribute("new") != null) {
        ArrayList<ItemCart> list2 = (ArrayList<ItemCart>) session.getAttribute("new");
        int n = 0;
        String userID = String.valueOf(session.getAttribute("userID"));
          boolean update = true;
    boolean update2 = true;
        for (ItemCart i : list2) {
          String category = i.getCategory();
             String itemName= i.getItemName();
                            
                                    

  

    Date dNow = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

    String date = ft.format(dNow);

    try {

        Connection con = new DbConnector().getConnection();
        Statement stmt = con.createStatement();

        if (i.getQuantity()>0) {
            update = false;
            update2 = false;
            int s5 = i.getQuantity();
           String q1 = "SELECT * FROM item where itemname='" + itemName + "' and category='" + category + "'";
            ResultSet rs1 = stmt.executeQuery(q1);
            if (rs1.next()) {
                String itemID = rs1.getString("itemID");
                String nq1= "INSERT INTO transactions(itemID,size,quantity,trans,date,userID) values('" +itemID+ "',"+i.getSize()+","+s5+",'IN','"+date+"','"+userID+"')";
                if(stmt.executeUpdate(nq1)>0){
                    update2=true;
                }
                
                String q2 = "SELECT * FROM currentstock where itemID='" + itemID + "' and size=" + i.getSize() + "";
                ResultSet rs2 = stmt.executeQuery(q2);
                if (rs2.next()) {
                    int s5old = Integer.parseInt(rs2.getString("quantity"));
                    int s5new = s5old + s5;
                    String q3 = "UPDATE currentstock SET quantity=" + s5new + " WHERE itemID='" + itemID + "' and size =" + i.getSize() + "";
                    if (stmt.executeUpdate(q3) > 0) {
                        update = true;
                    }
                } else {
                    String q4 = "INSERT INTO currentstock(itemID,size,quantity) VALUES('" + itemID + "'," + i.getSize() + "," + s5 + ")";
                    if (stmt.executeUpdate(q4) > 0) {
                        update = true;
                    }
                }
            }
        }
    }catch (Exception e) {
        throw new ServletException(e.getMessage());
    }
        }
    
    
    
        if (update && update2) {
            session.setAttribute("new", null);
     response.sendRedirect("../index.jsp");
            

        } else {
        %>  
Error occurred. Try again. 
<%
        }
}

%>