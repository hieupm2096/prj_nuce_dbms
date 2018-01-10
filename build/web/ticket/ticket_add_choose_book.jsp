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
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="../css/magic-check.min.css" />

    </head>

    <body>
        <!-- Navigation-->
        <div>
            <div class="card-body">
                <div class="table-responsive">
                    <sql:query dataSource="${db}" var="result">
                        EXEC get_book NULL, ?, 1
                        <sql:param value="${param.txtSearch}" />
                    </sql:query>
                    <c:choose>
                        <c:when test="${result.rowCount != 0}">
                            <table class="table table-bordered table-striped" id="table-book" width="100%" cellspacing="0" style="table-layout: fixed; word-wrap: break-word;">
                                <col width="10%">
                                <col width="42%">
                                <col width="42%">
                                <col width="6%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${result.rows}" varStatus="i">
                                        <tr>
                                            <td>${item._id}</td>
                                            <td>${item._name}</td>
                                            <td>${item._description}</td>
                                            <td>
                                                <input type="checkbox" name="chkBook" class="chk-choose-book" value="${item._id}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="alert alert-dark" style="margin: 10px;">
                                <h6>Number of books: <span id="books-num" class="badge badge-light">0</span>/3</h6>
                            </div>
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
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->

        <script src="../vendor/datatables/jquery.dataTables.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script>
            $(document).ready(function () {
                var table = $("#table-book").DataTable({
                    "bSort": false,
                    "bAutoWidth": false,
                    "paging": false
                });
                var bookNum = $(':checkbox:checked').length;
                $('#books-num').text(bookNum);
                $(':checkbox').on('change', function (e) {
                    bookNum = $(':checkbox:checked').length;
                    if (bookNum > 3) {
                        bookNum = 3;
                    }
                    $('#books-num').text(bookNum);
                    if ($(':checkbox:checked').length > 3) {
                        $(this).prop('checked', false);
                    }
                });
            });
        </script>
    </body>

</html>

