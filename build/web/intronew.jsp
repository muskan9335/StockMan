

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




                        </div>
                        <div class="col-md-6">
                            <div class="display-table"
                                 <h4>Edit items</h4>
                                <button id="btnadd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#new_item">Introduce New Item</button>
                            </div>
                            <div class="table-responsive" id="tablediv3">


                                <table id="mytable" class="table table-bordred table-striped">

                                    <thead>


                                    <th>Category</th>
                                    <th>Item Name</th>

                                    <th>Edit</th>

                                    </thead>
                                    <tbody id="tbodyreplace">
                                        <%
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockman", "root", "");

                                            Statement stmt = con.createStatement();
                                            String query = "SELECT * FROM item";
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {

                                        %>



                                        <tr>

                                            <td><%=rs.getString("category")%></td>
                                            <td><%=rs.getString("itemName")%></td>


                                            <td><p data-placement="top" title="Edit"><button onclick="edit('<%=rs.getString("itemName")%>', '<%=rs.getString("itemID")%>')" class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></button></p></td>

                                        </tr>


                                        <% } %>
                                    </tbody>

                                    <script type="text/javascript">
                                        function edit(name, itid) {
                                            $("#itid").val(itid);
                                            $("#name").val(name);
                                            $("#edit").modal();


                                        }

                                    </script>
                                </table>

                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="display-table"
                                 <h4>Edit Category</h4>
                                <button id="btnadd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#newcat">Add New Category</button>
                            </div>
                            <div class="table-responsive" id="tablediv3">


                                <table id="mytable" class="table table-bordred table-striped">

                                    <thead>


                                    <th>Category</th>


                                    <th>Edit</th>

                                    </thead>
                                    <tbody id="tbodyreplace">
                                        <%

                                            String query2 = "SELECT * FROM category";
                                            ResultSet rs2 = stmt.executeQuery(query2);
                                            while (rs2.next()) {

                                        %>



                                        <tr>

                                            <td><%=rs2.getString("type")%></td>



                                            <td><p data-placement="top" title="Edit"><button onclick="edit2('<%=rs2.getString("type")%>')" class="btn btn-primary btn-xs" data-title="Edit"  ><span class="glyphicon glyphicon-pencil"></span></button></p></td>

                                        </tr>


                                        <% } %>
                                    </tbody>

                                    <script type="text/javascript">
                                        function edit2(category) {
                                            $("#category").val(category);
                                            $("#cat").val(category);
                                            $("#edit2").modal();


                                        }

                                    </script>
                                </table>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                    <h4 class="modal-title custom_align" id="Heading">Edit Item Name</h4>
                                </div>
                                <div class="modal-body">

                                    <input class="form-control" type="text" id="name" >
                                    <input type="hidden" id="itid">


                                </div>
                                <div class="modal-footer ">
                                    <button type="button" onclick="update()" class="btn btn-primary" ><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                                </div>
                            </div>
                            <!-- /.modal-content --> 
                        </div>
                        <!-- /.modal-dialog --> 
                    </div>
                    <div class="modal fade" id="edit2" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                    <h4 class="modal-title custom_align" id="Heading">Edit Item Name</h4>
                                </div>
                                <div class="modal-body">

                                    <input class="form-control" type="text" id="category" >
                                    <input type="hidden" id="cat">


                                </div>
                                <div class="modal-footer ">
                                    <button type="button" onclick="update2()" class="btn btn-primary" ><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                                </div>
                            </div>
                            <!-- /.modal-content --> 
                        </div>
                        <!-- /.modal-dialog --> 
                    </div>
                    <script type="text/javascript">
                        function update() {
                            var name = $("#name").val();
                            var itid = $("#itid").val();



                            $.ajax(
                                    {type: "POST",
                                        datatype: "json",
                                        url: "jsp.changenew/updateName.jsp",
                                        data: {
                                            name: name,
                                            itid: itid




                                        },
                                        success: function(html) {

                                            $("#edit").modal("toggle");
                                            window.location.reload(true);


                                        }})

                        }

                    </script>

                    <script type="text/javascript">
                        function update2() {
                            var category = $("#category").val();
                            var cat = $("#cat").val();



                            $.ajax(
                                    {type: "POST",
                                        datatype: "json",
                                        url: "jsp.changenew/updateCat.jsp",
                                        data: {
                                            category: category,
                                            cat: cat



                                        },
                                        success: function(html) {

                                            $("#edit2").modal("toggle");
                                            window.location.reload(true);


                                        }})

                        }

                    </script>





                </div>
            </div>



        </div>







        <div class="container" style="margin-top: 10px;">
            <div class="row">
                <legend></legend>
                <p class="text-center">© Copyright 2019. All Rights Reserved.</p>
            </div>
        </div>

        <form name="form2" action="jsp.changenew/newitem.jsp" method="POST">

            <div id="new_item" class="modal fade" role="dialog">
                <div class="modal-dialog" style="width: 700px;">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header login-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Introduce New Item</h4>
                        </div>
                        <div class="modal-body"> <%
                            Class.forName("com.mysql.jdbc.Driver");

                            String query3 = "SELECT * FROM category";
                            ResultSet rs3 = stmt.executeQuery(query3);
                            %> <select name="category" class="form-control" required> <option selected disabled value="">Choose Category</option><%
                                while (rs3.next()) {

                                %>  <option value="<%=rs3.getString("type")%>"><%= rs3.getString("type")%></option>

                                <%
                                    }
                                %>
                            </select>
                            <input type="text" class="form-control" name="itemName" placeholder="Iteam Name">


                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" id="sub" class="btn btn-success" >Save</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>


        <form name="form2" action="jsp.changenew/newcat.jsp" method="POST">

            <div id="newcat" class="modal fade" role="dialog">
                <div class="modal-dialog" style="width: 700px;">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header login-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Add new Category</h4>
                        </div>
                        <div class="modal-body"> 
                            <input type="text" class="form-control" name="catName" placeholder="New Category">


                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" id="sub" class="btn btn-success" >Save</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>



</body>


<%
    } else {

        response.sendRedirect("login.html");

    }
%>
