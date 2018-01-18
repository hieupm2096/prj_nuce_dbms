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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/>


    </head>

    <body>
        <!-- Navigation-->
        <div>
            <!-- Example DataTables Card-->
            <div class="card-body">
                <div class="table-responsive">
                    <sql:query dataSource="${db}" var="result">
                        EXEC get_reader NULL, ?, NULL, NULL, ?
                        <sql:param value="${param.txtSearch}" />
                        <sql:param value="1" />
                    </sql:query>
                    <c:choose>
                        <c:when test="${result.rowCount != 0}">
                            <table class="table table-bordered table-striped" id="table-reader" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${result.rows}" varStatus="i">
                                        <tr>
                                            <td>${item._name}</td>
                                            <td>${item._email}</td>
                                            <td>${item._phone}</td>
                                            <td><a href="javascript:void(0);" onclick="addReader(${item._id});">Choose</a></td>
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

        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->



        <!-- Bootstrap core JavaScript-->
        <script type="text/javascript" src="../vendor/jquery/jquery.min.js"></script>
        <script src="http://localhost:8080/ProjectLibrary/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="http://localhost:8080/ProjectLibrary/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->

        <script src="http://localhost:8080/ProjectLibrary/vendor/datatables/jquery.dataTables.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="http://localhost:8080/ProjectLibrary/js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script>
            $(document).ready(function () {
                var table = $("#table-reader").DataTable({
                    "bSort": false,
                    "bAutoWidth": false,
                    "pageLength": 5,
                    "lengthMenu": [5, 10, 25]
                });
                addReader = function(rid) {
                    var url = window.location.href;
                    var pattern = 'rid';
                    var regex = new RegExp(pattern);
                    if (!regex.test(url)) {
                        pattern = 'bid';
                        regex = new RegExp(pattern);
                        if (!regex.test(url)) {
                            url += '?rid=' + rid;
                        } else {
                            url += '&rid=' + rid;
                        }
                    }
                    window.location = url;
                };
            });
        </script>
    </body>

</html>

