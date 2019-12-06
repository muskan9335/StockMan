
<%@page import="java.util.ArrayList"%>
<%@page import="my.classes.ItemCart" %>

<% if (session.getAttribute("new") == null) {
        ArrayList<ItemCart> list = new ArrayList<ItemCart>();
        if (request.getParameter("quantity") != null && Integer.parseInt(request.getParameter("quantity")) > 0) {
            ItemCart newitem5 = new ItemCart(String.valueOf(session.getAttribute("userID")), request.getParameter("category"), request.getParameter("itemName"), 5, Integer.parseInt(request.getParameter("quantity")));
            list.add(newitem5);
        }
        session.setAttribute("new", list);
        response.sendRedirect("../addtostock.jsp");

    } else {

        ArrayList<ItemCart> list = (ArrayList<ItemCart>) session.getAttribute("new");
        if (request.getParameter("quantity") != "" && Integer.parseInt(request.getParameter("quantity")) > 0) {
            ItemCart newitem5 = new ItemCart(String.valueOf(session.getAttribute("userID")), request.getParameter("category"), request.getParameter("itemName"), 5, Integer.parseInt(request.getParameter("quantity")));

            list.add(newitem5);
        }
        session.setAttribute("new", list);
        response.sendRedirect("../addtostock.jsp");

    }
%>