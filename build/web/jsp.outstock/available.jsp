<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String category = request.getParameter("category");
    String itemName = request.getParameter("itemName");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");

    Statement stmt = con.createStatement();
    String query5 = "SELECT * FROM currentstock where size=5 and itemID=(select itemID from item where itemName='" + itemName + "' and category='" + category + "')";
    int s5 = 0;
    {
%>
<tr>
    <td>Available</td>
    <%ResultSet rs5 = stmt.executeQuery(query5);
        if (rs5.next()) {
            s5 = Integer.parseInt(rs5.getString("quantity"));
    %>
    <td>
        <div style=" padding-left:2px;padding-right: 2px; margin-left: 2px; margin-right: 2px; ">
            <input style="border: 0px ; text-align: center" readonly="" value=" <%=s5%>" >
        </div>
    </td>
    <% } else {%>
    <td>
        <div style=" padding-left:2px;padding-right: 2px; margin-left: 2px; margin-right: 2px; ">
            <input style="border: 0px ; text-align: center" readonly="" value="0">
        </div>
    </td>
    <% }%>
</tr>
<tr>
    <td>Quantity</td>
    <td>
        <div style=" padding-left:2px;padding-right: 2px; margin-left: 2px; margin-right: 2px; ">
            <input type="number" id="size5" placeholder="Quantity" min="0" max="<%=s5%>" name="size5">
        </div>
    </td>
</tr>
<% }%>


