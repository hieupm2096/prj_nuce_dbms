<%-- 
    Document   : index
    Created on : Nov 30, 2017, 11:57:04 AM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Add New Book</title>
        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/bootstrap-select.css">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="../index.jsp">Library Manger</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                        <a class="nav-link" href="../index.jsp">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <span class="nav-link-text">Dashboard</span>
                        </a>
                    </li>

                    <!-- Book Manager -->
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapse" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion" style="color: white;">
                            <i class="fa fa-fw fa-wrench"></i>
                            <span class="nav-link-text">Books</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseComponents">
                            <li>
                                <a href="../category/cate_list.jsp">Category</a>
                            </li>
                            <li>
                                <a href="../author/author_list.jsp">Author</a>
                            </li>
                            <li>
                                <a href="book_list.jsp" style="color: white;">Book</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Reader Manager -->
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Readers">
                        <a class="nav-link" href="../reader/reader_list.jsp">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Readers</span>
                        </a>
                    </li>

                    <!-- Ticket Manager -->
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tickets">
                        <a class="nav-link" href="../ticket/ticket_list.jsp">
                            <i class="fa fa-fw fa-link"></i>
                            <span class="nav-link-text">Tickets</span>
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <span class="nav-link" style="cursor: default; color: white;">Welcome ${currentSession._name}</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="content-wrapper">
            <div class="col-lg-12">
                <h1 class="page-header" style="display: inline-block;" inline>Add New Book</h1>
            </div>
            <div class="container-fluid">
                <!-- Form -->
                <div class="card mb-3">
                    <div class="card-header"> New Book</div>
                    <div class="card-body">
                        <form action="book_controller.jsp?ac=add" method="POST">
                            <!--sql-->
                            <sql:query dataSource="${db}" var="cateRs">
                                EXEC dbo.get_cate
                            </sql:query>
                            <sql:query dataSource="${db}" var="authorRs">
                                EXEC dbo.get_author
                            </sql:query>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Book Name:</label>
                                    <input name="txtName" type="text" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Category:</label>
                                    <select name="slCate" class="form-control selectpicker" multiple data-width="100%" data-live-search="true" data-max-options="5" required>
                                        <c:forEach var="cate" items="${cateRs.rows}" varStatus="i">
                                            <option value="${cate._id}" ${cate._status ? '' : 'disabled'}>${cate._name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Author:</label>
                                    <select name="slAuthor" class="form-control selectpicker" multiple data-width="100%" data-live-search="true" data-max-options="5" required>
                                        <c:forEach var="author" items="${authorRs.rows}" varStatus="i">
                                            <option value="${author._id}" ${author._status ? '' : 'disabled'}>${author._name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-2">
                                    <label>Price:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span>
                                        <input name="txtPrice" class="form-control" type="number" step="0.01" min="0" max="999" required>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label>Quantity:</label>
                                    <input name="txtQuantity" type="number" class="form-control" min="1" required value="1" >
                                </div>
                                <div class="form-group col-md-2">
                                    <label>Year of Publication:</label>
                                    <input id="input_year" name="txtYear" type="number" class="form-control" min="1900" required >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Publisher:</label>
                                    <input name="txtPublisher" type="text" class="form-control" required>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Description:</label>
                                    <textarea name="txtDescription" class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${not empty param.success}">
                                    <div class="alert alert-success alert-dismissible fade show form-group">
                                        <button type="button" class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        Book added successfully
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${not empty param.fail}">
                                        <div class="alert alert-danger alert-dismissible fade show form-group">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span>&times;</span>
                                            </button>
                                            Error: Book has not been added
                                        </div>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <div style="float: right;">
                                <input type="submit" class="btn btn-outline-primary btn-primary" value="Add">
                                <input type="reset" class="btn btn-outline-primary btn-primary" value="Reset">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--Button-->

        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                    <small>Copyright © Group 8 - Library Manager</small>
                </div>
            </div>
        </footer>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="#">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->

        <script src="../vendor/dataReaders/jquery.dataReaders.js"></script>
        <script src="../vendor/dataReaders/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script src="../js/bootstrap-select.js"></script>
        <script>
            var today = new Date();
            var year = today.getFullYear();
            document.getElementById("input_year").setAttribute("max", year);
            $('[type=reset]').click(function () {
                $('.selectpicker').selectpicker('render');
            });
        </script>
    </body>

</html>

