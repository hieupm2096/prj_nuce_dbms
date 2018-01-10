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
        <title>Update Reader</title>
        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
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
                        <a class="nav-link nav-link-collapse collapse" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
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
                                <a href="../book/book_list.jsp">Book</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Reader Manager -->
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Readers">
                        <a class="nav-link" href="reader_list.jsp" style="color: white;">
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
                <h1 class="page-header" style="display: inline-block;">Update Reader</h1>
            </div>
            <div class="container-fluid">
                <!-- Example Form Card-->
                <div class="card mb-3" style="width: 90%;">
                    <div class="card-header"> New Reader</div>
                    <div class="card-body">
                        <form action="reader_controller.jsp?ac=ud&id=${param.id}" method="POST">
                            <!--sql-->
                            <sql:query dataSource="${db}" var="result" maxRows="1">
                                EXEC get_reader ?
                                <sql:param value="${param.id}" />
                            </sql:query>
                            <c:forEach var="item" items="${result.rows}">
                                <c:set var="foundReader" value="${item}" />
                            </c:forEach>
                            <div class="form-group">
                                <label>Reader Name:</label>
                                <input name="txtName" type="text" class="form-control" value="${foundReader._name}" placeholder="enter reader name" required/>
                            </div>
                            <div class="form-group">
                                <label>Email Address:</label>
                                <input name="txtEmail" type="email" class="form-control" value="${foundReader._email}" placeholder="name@example.com" required />
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label>Phone:</label>
                                    <input name="txtPhone" type="text" class="form-control" pattern="\d*" value="${foundReader._phone}" placeholder="enter phone number" required />
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Day of birth:</label>
                                    <input name="txtDob" type="date" class="form-control" value="${foundReader._dob}" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label>Gender:</label>
                                    <select name="slGender" class="form-control selectpicker">
                                        <option value="0" ${foundReader._gender ? '' : 'selected'}>Male</option>
                                        <option value="1" ${foundReader._gender ? 'selected' : ''}>Female</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Status:</label>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input name="chkStatus" type="checkbox" ${foundReader._status ? 'checked' : ''} > Available
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Address:</label>
                                <textarea name="txtAddress" class="form-control" placeholder="enter reader address" required cols="2">${foundReader._address}</textarea>
                            </div>
                            <c:choose>
                                <c:when test="${not empty param.success}">
                                    <div class="alert alert-success alert-dismissible fade show form-group">
                                        <button type="button" class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        Reader updated successfully
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${not empty param.fail}">
                                        <div class="alert alert-danger alert-dismissible fade show form-group">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span>&times;</span>
                                            </button>
                                            Error: Reader has not been updated
                                        </div>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            <div style="float: right">
                                <input type="submit" class="btn btn-outline-primary btn-primary" value="Update">
                                <input type="reset" class="btn btn-outline-primary btn-primary" value="Reset">
                            </div>
                        </form>
                    </div>
                </div>

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
                            <a class="btn btn-primary" href="login.html">Logout</a>
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
            <script src="../js/sb-admin-dataReaders.min.js"></script>
            <script src="../js/sb-admin-Books.min.js"></script>
        </div>
    </body>

</html>
