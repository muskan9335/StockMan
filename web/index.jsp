
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


<head>
    <title>Inventoy Management System</title>

    <link rel="icon" href="images/icon.png">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <link rel="stylesheet" type="text/css" href="css/slider.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Inventory System</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


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
    <section class="content-header">
</div>


<body class="home" style='background-color: Aquamarine;'>

    <div class="col-xs-12" id="verti"></div>
    <section class="content-header">
        <div class="pull-right" style="float:right;">
            <ol class="breadcrumb">
                <li><a href="index.jsp"><i class="fa fa-dashboard"></i>  Home</a></li>
            </ol>
        </div>

        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
    </section>

    <div class="container-fluid display-table">
        <div class="row display-table-row" id="home3">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                <div class="navi">
                    <ul>
                        <form action="#" method="get" class="sidebar-form">

                        </form>
                        <!-- /.search form -->
                        <!-- sidebar menu: : style can be found in sidebar.less -->
                        <ul class="sidebar-menu">

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
                            <li><a href="viewstock.jsp" > <i class="fa fa-plus-square" ></i><span class="hidden-xs hidden-sm">View Stock</span><i class="fa fa-angle-left pull-right"></i></a></li>  
                            <li><a href="intronew.jsp" ><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Introduce new Item</span><i class="fa fa-angle-left pull-right"></i></a></li>
                            <li><a href="sendout.jsp"><i class="fa fa-truck" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Send to Branches</span><i class="fa fa-angle-left pull-right"></i></a></li>
                            <li><a href="search.jsp"><i class="fa fa-search" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Search</span><i class="fa fa-angle-left pull-right"></i></a></li>


                        </ul>
                    </ul>
                </div>
            </div>
            <div>
                <h1>
                    <center>Welcome to Inventory Management System!</center>
                </h1>
            </div>
        </div>
        <div class="control-sidebar-bg"></div>
        <div class="container" style="margin-top: 10px;">
            <div class="row">
                <legend></legend>
                <p class="text-center">© Copyright 2019. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</body>


<%
    } else {

        response.sendRedirect("login.html");

    }
%>
