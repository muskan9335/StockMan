<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%
    String category = request.getParameter("category");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");

    Statement stmt = con.createStatement();
    String query = "SELECT * FROM item where category='" + category + "'";

    ResultSet rs4 = stmt.executeQuery(query);

%> 
<select name="itemName" class="form-control" id="home7" required> <option selected disabled value="">Choose Item</option><%                      while (rs4.next()) {

    %>  <option value="<%=rs4.getString("itemName")%>"><%= rs4.getString("itemName")%></option>

    <%
        }


    %>
</select>


