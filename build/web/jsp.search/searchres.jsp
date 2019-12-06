<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String cat = request.getParameter("cat");
    String name = request.getParameter("name");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");
    Statement stmt3 = con.createStatement();
    String query3 = "SELECT currentstock.size,currentstock.quantity,item.itemname FROM currentstock inner join item on currentstock.itemID=item.itemID where itemName='" + name + "' and category='" + cat + "'";
    ResultSet rs3 = stmt3.executeQuery(query3);

    if (!rs3.next()) {
%>
No items
<%
} else {
%>
<table id="acrylic">
    <thead>
        <tr>
            <th >Item Name</th>
            <th>Unit</th>
            <th>Quantity</th>

        </tr>
    </thead>
    <tbody>

        <%
            do {
        %>
        <tr>
            <td data-label="Name"><%=rs3.getString("itemname")%></td>
            <td data-label="Age"><%=rs3.getString("size")%></td>
            <td data-label="Weight"><%=rs3.getString("quantity")%></td>
        </tr>
        <%
            }while (rs3.next());
        %>
    </tbody>
</table>

<% }%>



