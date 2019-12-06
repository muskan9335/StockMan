
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

<body>
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

    <section class="content-header" style="background-color:lightblue;">
        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb pull-right">
            <li><a href="index.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
        </ol>
    </section>
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
        </div>
    </div>


    <div id="bodycontent" class="col-md-10">

        <div class="container" class="col-md-12" >
            <legend><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CALCULATOR</b></legend>
            <form name="Calc" class="form-inline">

                <table border=6>
                    <tr>
                        <td align=right>
                            <input type="text"   name="Input" size="35"  style=" text-align: justify">
                            <br>
                        </td>
                    </tr>
                    <td>

                        <input type="button" NAME="one"   VALUE="  1  " OnClick="Calc.Input.value += '1'">
                        <input type="button" NAME="two"   VALUE="  2  " OnCLick="Calc.Input.value += '2'">
                        <input type="button" NAME="three" VALUE="  3  " OnClick="Calc.Input.value += '3'">
                        <input type="button" NAME="times" VALUE="  -  " OnClick="Calc.Input.value += '-'">
                        <input type="button" NAME="r_paren" VALUE="  )  " OnClick="Calc.Input.value += ')'">
                        <br>

                        <input type="button" NAME="four"  VALUE="  4  " OnClick="Calc.Input.value += '4'">
                        <input type="button" NAME="five"  VALUE="  5  " OnCLick="Calc.Input.value += '5'">
                        <input type="button" NAME="six"   VALUE="  6  " OnClick="Calc.Input.value += '6'">
                        <input type="button" NAME="minus" VALUE="  X  " OnClick="Calc.Input.value += '*'">
                        <input type="button" NAME="l_paren" VALUE="  (  " OnClick="Calc.Input.value += '('">
                        <br>

                        <input type="button" NAME="seven" VALUE="  7  " OnClick="Calc.Input.value += '7'">
                        <input type="button" NAME="eight" VALUE="  8  " OnCLick="Calc.Input.value += '8'">
                        <input type="button" NAME="nine"  VALUE="  9  " OnClick="Calc.Input.value += '9'">
                        <input type="button" NAME="plus"  VALUE="  /  " OnClick="Calc.Input.value += '/'">
                        <input type="button" NAME="clear"VALUE="  C  " OnClick="Calc.Input.value = ''">
                        <br>

                        <input type="button" NAME="point" STYLE="font-size:110%" VALUE="  .  " OnClick="Calc.Input.value += '.'">
                        <input type="button" NAME="zero"  VALUE="  0  " OnClick="Calc.Input.value += '0'">
                        <input type="button" NAME="Equals"  VALUE="  =  " OnClick="Calc.Input.value = eval(Calc.Input.value)">
                        <input type="button" NAME="div"   VALUE="  +  " OnClick="Calc.Input.value += '+'">
                    </td>
                </table>
            </form>
        </div>


        <div class="display-table" id="bodycontent2">
            <div class="wrapper col-md-12" id="home4" >
                <div id="border2" class="display-tables"  >
                    <div class="panel-heading" style="padding:0px; text-align: center;    font-size:20px">
                        Latest Transactions
                    </div>
                    <table id="acrylic" >
                        <thead>
                            <tr>
                                <th>In/Out</th>
                                <th>Category</th>
                                <th>Item Name</th>
                                <th>Total</th>
                                <th>Date/Time</th>

                            </tr>
                            </tead>
                        <tbody >

                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");
                                String query7 = "SELECT transactions.date ,transactions.trans,sum(transactions.quantity) as total,item.itemName,item.category FROM transactions inner join item on transactions.itemID=item.itemID group by itemname,trans limit 5";
                                Statement stmt3 = con.createStatement();
                                ResultSet rs7 = stmt3.executeQuery(query7);
                                while (rs7.next()) {
                            %>
                        <center>
                            <tr>
                                <td data-label="Name"><%=rs7.getString("trans")%></td>
                                <td data-label="Name"><%=rs7.getString("category")%></td>
                                <td data-label="Name"><%=rs7.getString("itemName")%></td>
                                <td data-label="Age"><%=rs7.getString("total")%></td>
                                <td data-label="Weight"><%=rs7.getString("date")%></td>

                            </tr>
                        </center>
                        <% } %>

                        </tbody>
                    </table>
                </div>  
            </div>
        </div>

        <!-- /.sidebar -->                         



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
