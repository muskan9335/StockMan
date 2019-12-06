
<%@page import="java.util.ArrayList"%>
<%@page import="my.classes.ItemCart" %>

<% if (session.getAttribute("new2") == null) {
        ArrayList<ItemCart> list2 = new ArrayList<ItemCart>();
        if (request.getParameter("size5") != "" && Integer.parseInt(request.getParameter("size5")) > 0) {
            ItemCart newitem5 = new ItemCart(String.valueOf(session.getAttribute("userID")), request.getParameter("category"), request.getParameter("itemName"), 5, Integer.parseInt(request.getParameter("size5")));

            list2.add(newitem5);
        }
        session.setAttribute("new2", list2);
        response.sendRedirect("../sendout.jsp");

    } else {

        ArrayList<ItemCart> list2 = (ArrayList<ItemCart>) session.getAttribute("new2");
        if (request.getParameter("size5") != "" && Integer.parseInt(request.getParameter("size5")) > 0) {
            ItemCart newitem5 = new ItemCart(String.valueOf(session.getAttribute("userID")), request.getParameter("category"), request.getParameter("itemName"), 5, Integer.parseInt(request.getParameter("size5")));

            list2.add(newitem5);
        }
        session.setAttribute("new2", list2);
        response.sendRedirect("../sendout.jsp");

    }
%>