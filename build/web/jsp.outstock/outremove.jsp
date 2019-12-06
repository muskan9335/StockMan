<%@page import="java.util.ArrayList"%>
<%@page import="my.classes.ItemCart"%>
<%
int id=Integer.parseInt(request.getParameter("deleteid"));
ArrayList<ItemCart> list2 = (ArrayList<ItemCart>) session.getAttribute("new2");
       list2.remove(id-1);
       session.setAttribute("new2", list2);
        

%>