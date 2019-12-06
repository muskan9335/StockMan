<%@page import="my.classes.ItemCart"%>
<%@page import="java.util.ArrayList"%>
<%
int n = Integer.parseInt(request.getParameter("n"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

ArrayList<ItemCart> list2 = (ArrayList<ItemCart>) session.getAttribute("new");
list2.get(n-1).setQuantity(quantity);
session.setAttribute("new", list2);
        


%>