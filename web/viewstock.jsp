
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="my.classes.ItemCart" %>


<%

    if (session.getAttribute("uname") != null) {
%>

<!DOCTYPE html>

<title>Inventoy Management System</title>
<link rel="icon" href="images/icon.png">
<head>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <link rel="stylesheet" type="text/css" href="css/slider.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">


    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/slider.js"></script>
    <script src="js/dashboard.js"></script>



</head>


<div class="navbar-wrapper">
    <div class="container-fluid" id="home1" > 
        <nav class="navbar" id="home2">
            <div class="container">
                <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">

                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>

                    <a class="navbar-brand" >Inventory Management System</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">


                    <ul class="nav navbar-nav pull-right">
                        <li class=" "><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <%=session.getAttribute("uname")%>  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class=""><a href="jsp.logreg/logout.jsp">Logout</a></li>

                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<body class="home">
    <div class="col-xs-12" id="verti"></div>
    <div class="container-fluid display-table">
        <div class="row display-table-row" id="home3">

            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <section class="content-header">
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-dashboard"></i>Home</a></li>

                    </ol>
                </section>

                <div class="navi">
                    <ul>

                        <li class="treeview">
                            <a href="sales.jsp">
                                <i class="fa fa-shopping-basket"></i> <span>Sales</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>

                        </li>
                        <li class="treeview">
                            <a href="addtostock.jsp">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Purchase</span>
                                <i class="fa fa-angle-left pull-right"></i>                                                       
                                </span>
                            </a>

                        </li>

                        <li><a href="viewstock.jsp" > <i class="fa fa-plus-square"></i><span class="hidden-xs hidden-sm">View Stock</span></a></li>                           

                        <li><a href="intronew.jsp" ><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Introduce new Item</span></a></li>
                        <li><a href="sendout.jsp"><i class="fa fa-truck" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Send to Branches</span></a></li>
                        <li><a href="search.jsp"><i class="fa fa-search" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Search</span></a></li>
                    </ul>
                </div>

            </div>

            <div id="bodycontent" class="col-md-10">
                <div class="display-table" id="bodycontent2">
                    <div class="wrapper col-md-6" id="home4" >
                        <div id="border2" class="display-tables">
                            <div class="panel-heading" style="padding:0px; text-align: center;    font-size:20px">
                                Current Stock
                            </div>
                            <table id="acrylic">
                                <thead>

                                    <tr>
                                        <th>Category</th>
                                        <th>Item Name</th>
                                        <th>Unit</th>
                                        <th>Quantity</th>

                                    </tr>
                                </thead>
                            </table>
                            <div id="tablediv">

                                <table id="acrylic">





                                    <tbody >

                                        <%
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");
                                            Statement stmt3 = con.createStatement();
                                            String query3 = "SELECT currentstock.size,currentstock.quantity,item.itemname,item.category FROM currentstock inner join item on currentstock.itemID=item.itemID";
                                            ResultSet rs3 = stmt3.executeQuery(query3);
                                            while (rs3.next()) {
                                        %>
                                        <tr>
                                            <td data-label="Category"><%=rs3.getString("category")%></td>
                                            <td data-label="Name"><%=rs3.getString("itemname")%></td>
                                            <td data-label="Age"><%=rs3.getString("size")%></td>
                                            <td data-label="Weight"><%=rs3.getString("quantity")%></td>

                                        </tr>
                                        <% } %>

                                    </tbody>


                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper col-md-6" id="home4" >
                        <div id="border2" class="display-tables" style="height:630px;">
                            <div class="panel-heading" style="padding:0px; text-align: center;    font-size:20px">
                                Low Stock
                            </div>

                            <div id="tablediv2">

                                <table id="acrylic">
                                    <thead>

                                        <tr>

                                            <th>Item Name</th>
                                            <th>Unit</th>
                                            <th>Quantity</th>

                                        </tr>
                                    </thead>
                                    <tbody >

                                        <%
                                            String query6 = "SELECT currentstock.size,currentstock.quantity,item.itemname FROM currentstock inner join item on currentstock.itemID=item.itemID order by currentstock.quantity LIMIT 5";
                                            ResultSet rs6 = stmt3.executeQuery(query6);
                                            while (rs6.next()) {
                                        %>
                                        <tr>
                                            <td data-label="Name"><%=rs6.getString("itemname")%></td>
                                            <td data-label="Age"><%=rs6.getString("size")%></td>
                                            <td data-label="Weight"><%=rs6.getString("quantity")%></td>

                                        </tr>
                                        <% } %>

                                    </tbody>





                                </table>
                            </div>
                        </div>

                    </div>



                </div>
            </div>



            <div class="container" style="margin-top: 10px;">
                <div class="row">
                    <legend></legend>
                    <p class="text-center">© Copyright 2019.All Rights Reserved.</p>
                </div>
            </div>



            </body>


            <%
                } else {

                    response.sendRedirect("login.html");

                }
            %>
