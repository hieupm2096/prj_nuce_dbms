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
        <title>Reader Manager</title>
        <!-- Bootstrap core CSS-->
        <link href="http://localhost:8080/ProjectLibrary/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="http://localhost:8080/ProjectLibrary/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="http://localhost:8080/ProjectLibrary/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="http://localhost:8080/ProjectLibrary/css/sb-admin.min.css" rel="stylesheet">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <jsp:include page="../template/navbar.jsp" />
        <!--Content-->
        <div class="content-wrapper">
            <div class="col-lg-12">
                <a href="reader_list.jsp">
                    <h1 class="page-header" style="display: inline-block;">Reader List</h1>
                </a>
            </div>
            <div class="container-fluid">
                <!-- Example DataTables Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i> Reader
                        <form action="reader_list.jsp?ac=search" method="POST" style="float: right;">
                            <div class="input-group">
                                <input name="txtSearch" type="text" class="form-control" placeholder="search for..." value="${param.txtSearch}">
                                <span class="input-group-btn">
                                    <input type="submit" class="btn btn-outline-secondary" value="Go">
                                </span>
                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <sql:query dataSource="${db}" var="result">
                                EXEC get_reader NULL, ?
                                <sql:param value="${param.txtSearch}" />
                            </sql:query>
                            <c:choose>
                                <c:when test="${result.rowCount != 0}">
                                    <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Reader Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${result.rows}" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td>${item._name}</td>
                                                    <td>${item._email}</td>
                                                    <td>${item._phone}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item._status}">
                                                                Available
                                                            </c:when>
                                                            <c:otherwise>
                                                                N/A
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><a href="reader_ud.jsp?id=${item._id}">Update</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>No Result</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!--Button-->
                <div class="card-md3">
                    <a href="reader_add.jsp" class="btn btn-outline-primary btn-primary" style="text-decoration: none; text-transform: none; float: right;">
                        <i class="fa fa-plus">  Add New Reader</i>
                    </a>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <!--Footer-->
            <jsp:include page="../template/footer.jsp" />
            <!-- Scroll to Top Button-->
            <jsp:include page="../template/scrollToTop.jsp" />
            <!-- Logout Modal-->
            <jsp:include page="../template/logout.jsp" />
            <!-- Bootstrap core JavaScript-->
            <script src="http://localhost:8080/ProjectLibrary/vendor/jquery/jquery.min.js"></script>
            <script src="http://localhost:8080/ProjectLibrary/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="http://localhost:8080/ProjectLibrary/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            
            <script src="http://localhost:8080/ProjectLibrary/vendor/datatables/jquery.dataTables.js"></script>
            <script src="http://localhost:8080/ProjectLibrary/vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="http://localhost:8080/ProjectLibrary/js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="http://localhost:8080/ProjectLibrary/js/sb-admin-datatables.min.js"></script>
        </div>
    </body>

</html>

