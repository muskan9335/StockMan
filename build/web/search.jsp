
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

                    <a class="navbar-brand" >StockMan</a>
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
<section class="content-header" style="background-color:lightblue;">
        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb pull-right">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
        </ol>
    </section>
<body class="home">
    <div class="col-xs-12" id="verti"></div>
    <div class="container-fluid display-table">
        <div class="row display-table-row" id="home3">

            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

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
                        <li><a href="index.jsp" > <i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                        <li><a href="viewstock.jsp" > <i class="fa fa-plus-square" ></i><span class="hidden-xs hidden-sm">View Stock</span><i class="fa fa-angle-left pull-right"></i></a></li>                           


                        <li><a href="intronew.jsp" ><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Introduce new Item</span></a></li>
                        <li><a href="sendout.jsp"><i class="fa fa-truck" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Send to Branches</span></a></li>
                        <li><a href="search.jsp"><i class="fa fa-search" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Search</span></a></li>
                    </ul>
                </div>

            </div>

            <div id="bodycontent4" class="col-md-10">
                <div class="display-table" id="bodycontent2">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");

                        Statement stmt = con.createStatement();
                        String query = "SELECT * FROM item";
                        String query4 = "SELECT * FROM category";
                        ResultSet rs4 = stmt.executeQuery(query4);
                    %> 
                    <select name="category" class="form-control" id="home6" required> <option selected disabled value="">Choose Category</option><%
                        while (rs4.next()) {

                        %>  <option value="<%=rs4.getString("type")%>"><%= rs4.getString("type")%></option>

                        <%
                            }
                            ResultSet rs = stmt.executeQuery(query);


                        %></select>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            $("#home6").change(function() {
                                var category = $("#home6").val();


                                $.ajax(
                                        {type: "POST",
                                            datatype: "json",
                                            url: "jsp.newstock/itemdrop.jsp",
                                            data: {
                                                category: category},
                                            success: function(html) {
                                                $('#home7').html(html);


                                            }})
                            })
                        });
                    </script>

                    <select name="itemName" class="form-control" id="home7" required> <option selected disabled value="">Choose Item</option></select>
                    <div id="newdiv"></div>

                    <script type="text/javascript">
                        $(document).ready(function() {
                            $("#home7").change(function() {
                                var cat = $("#home6").val();
                                var name = $("#home7").val();

                                $.ajax(
                                        {type: "POST",
                                            datatype: "json",
                                            url: "jsp.search/searchres.jsp",
                                            data: {
                                                cat: cat,
                                                name: name
                                            },
                                            success: function(html) {



                                                $('#newdiv').html(html);
                                            }});
                            });
                        });



                    </script>
                </div>
            </div>



            <div class="container" style="margin-top: 10px;">
                <div class="row">
                    <legend></legend>
                    <p class="text-center">© Copyright 2016. UWU Production. All Rights Reserved.</p>
                </div>
            </div>



            </body>


            <%    } else {

                    response.sendRedirect("login.html");

                }
            %>
