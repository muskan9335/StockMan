

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

<title>Inventory Management System</title>
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
                        <li><a href="viewstock.jsp" > <i class="fa fa-plus-stock" ></i><span class="hidden-xs hidden-sm">View Stock</span> <i class="fa fa-angle-left pull-right"></i></a></li>
                        <li><a href="intronew.jsp" ><i class="fa fa-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Introduce new Item</span><i class="fa fa-angle-left pull-right"></i></a></li>
                        <li><a href="sendout.jsp"><i class="fa fa-truck" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Send to Branches</span><i class="fa fa-angle-left pull-right"></i></a></li>
                        <li><a href="search.jsp"><i class="fa fa-search" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Search</span><i class="fa fa-angle-left pull-right"></i></a></li>
                    </ul>
                </div>
            </div>
            <div id="bodycontent3" class="col-md-10">
                <div class="display-table" id="bodycontent2">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-5">
                                <h4>New Stock</h4>
                            </div>
                            <div class="col-md-7">
                                <form action="jsp.newstock/additem.jsp" method="POST"><button type="submit"id="btncheck" type="button" class="btn btn-success" >Check in Stock</button></form>
                                <button id="btnadd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_item">Add to list</button>
                            </div>
                        </div>
                        <div class="table-responsive"> 
                            <table id="mytable" class="table table-bordred table-striped">
                                <thead>
                                <th>Category</th>
                                <th>Item Name</th>
                                <th>Quantity</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                </thead>
                                <tbody id="tbodyreplace">
                                    <%
                                        if (session.getAttribute("new") != null) {
                                            ArrayList<ItemCart> list2 = (ArrayList<ItemCart>) session.getAttribute("new");
                                            int n = 0;

                                            for (ItemCart i : list2) {
                                                n++;
                                    %>
                                    <tr>
                                        <td><%=i.getCategory()%></td>
                                        <td><%=i.getItemName()%></td>
                                        <td><%=i.getQuantity()%></td>

                                        <td><p data-placement="top" data-toggle="tooltip"  title="Edit"><button onclick="edit('<%=n%>', '<%=i.getQuantity()%>')" class="btn btn-primary btn-xs" data-title="Edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                                        <td><p data-placement="top" title="Delete"><button  onclick="del('<%=n%>')"  class="btn btn-danger btn-xs" data-title="Delete"  ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                                    </tr>

                                    <% }
                                        }%>
                                </tbody>

                            </table>
                            <script type="text/javascript">
                                function edit(n, quantity) {
                                    $("#n").val(n);
                                    $("#quantity").val(quantity);
                                    $("#edit").modal();
                                }
                            </script>
                            <script type="text/javascript">
                                function del(n) {

                                    var n = n;
                                    $.ajax(
                                            {type: "POST",
                                                datatype: "json",
                                                url: "jsp.newstock/remstock.jsp",
                                                data: {
                                                    deleteid: n
                                                },
                                                success: function(html) {

                                                    window.location.reload(true);
                                                }})
                                }
                            </script>
                            <div class="clearfix"></div>
                        </div>

                    </div>

                    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                    <h4 class="modal-title custom_align" id="Heading">Edit Quantity</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input class="form-control " type="text" id="quantity">
                                        <input type="hidden" id="n">
                                    </div>

                                </div>
                                <div class="modal-footer ">
                                    <button type="button" onclick="update()" class="btn btn-primary" ><span class="glyphicon glyphicon-ok-sign"></span> Update</button> </div>
                            </div>
                            <!-- /.modal-content --> 
                        </div>
                        <!-- /.modal-dialog --> 
                    </div>
                    <script type="text/javascript">
                        function update() {
                            var n = $("#n").val();
                            var quantity = $("#quantity").val();
                            $.ajax(
                                    {type: "POST",
                                        datatype: "json",
                                        url: "jsp.newstock/updatequantity.jsp",
                                        data: {
                                            n: n,
                                            quantity: quantity},
                                        success: function(html) {
                                            $("#edit").modal("toggle");
                                            window.location.reload(true);
                                        }})
                        }
                    </script>





                </div>
            </div>



        </div>


        <form name="form1" action="jsp.newstock/addtocart.jsp" method="POST">

            <div id="add_item" class="modal fade" role="dialog">
                <div class="modal-dialog" style="width: 700px;">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header login-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">New Stock</h4>
                        </div>
                        <div class="modal-body" >
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

                            <div class="col-lg-2" style="height:42px; padding-left: 0px; padding-right: 0px ; width: 12%;">
                                <label style="margin-bottom: 0px; margin: 11px">Quantity</label>
                            </div>
                            <div class="col-lg-3" style="width:14%; padding-left:2px;padding-right: 2px; margin-left: 2px; margin-right: 2px; ">
                                <input type="number" min="0" id="size5" placeholder="quantity" name="quantity">
                            </div>
                          
                            <!--    <select class="form-control"> <option selected disabled>Location</option>
                                    <option>A Hall</option>
                               
                                </select> !-->

                            <div class="modal-footer">
                                <button type="button" id="btncan" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" id="btnsave" class="btn btn-success" >Save</button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>


        </form>




        <div class="container" style="margin-top: 10px;">
            <div class="row">
                <legend></legend>
                <p class="text-center">© Copyright 2019. All Rights Reserved.</p>
            </div>
        </div>



</body>


<%    } else {

        response.sendRedirect("login.html");

    }
%>
