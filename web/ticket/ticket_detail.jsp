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
        <title>Ticket Detail</title>
        <!-- Bootstrap core CSS-->
        <link href="http://localhost:8080/ProjectLibrary/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="http://localhost:8080/ProjectLibrary/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="http://localhost:8080/ProjectLibrary/css/sb-admin.min.css" rel="stylesheet">
        <link href="http://localhost:8080/ProjectLibrary/css/bootstrap-select.css" rel="stylesheet">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <jsp:include page="../template/navbar.jsp" />
        <!--Content-->
        <div class="content-wrapper">
            <div class="col-lg-12">
                <h1 class="page-header" style="display: inline-block;">Ticket Detail</h1>
            </div>
            <div class="container-fluid">
                <!-- Form -->
                <div class="card mb-3">
                    <div class="card-header">Ticket</div>
                    <div class="card-body">
                        <!--sql-->
                        <sql:query dataSource="${db}" var="ticketRs">
                            EXEC dbo.get_ticket ?
                            <sql:param value="${param.id}" />
                        </sql:query>

                        <c:forEach var="item" items="${ticketRs.rows}" varStatus="i">
                            <c:set var="foundTicket" value="${item}" />
                        </c:forEach>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <label>Ticket ID:</label>
                                <input name="txtTicketNo" type="text" class="form-control" value="${foundTicket._ticket_no}" disabled>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Created By:</label>
                                <div>
                                    <a href="#" text-align="center">${foundTicket.librarian_username}</a>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Status:</label>
                                <c:choose>
                                    <c:when test="${foundTicket._status}">
                                        <div style="color: #3c763d;">
                                            <strong>Available</strong>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="color: #a94442;">
                                            <strong>Not Available</strong>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label>Reader ID:</label>
                                <input name="txtReaderId" type="text" class="form-control" value="${foundTicket.reader_id}" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Reader Name:</label>
                                <input name="txtReaderName" type="text" class="form-control" value="${foundTicket.reader_name}" disabled>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Date Create:</label>
                                <input name="txtDateCreate" type="date" class="form-control" value="${foundTicket._date_create}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Books In Ticket:</label>
                            <div class="table-responsive">
                                <!--sql-->
                                <sql:query dataSource="${db}" var="result">
                                    EXEC get_ticket_book ?
                                    <sql:param value="${param.id}" />
                                </sql:query>
                                <c:choose>
                                    <c:when test="${result.rowCount != 0}">
                                        <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                            <col width="5%">
                                            <col width="35%">
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="30%">
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="5%">
                                            <col width="5%">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Expire</th>
                                                    <th>Return</th>
                                                    <th>Fee</th>
                                                    <th>Fine</th>
                                                    <th>Description</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${result.rows}" varStatus="i">
                                                    <tr>
                                                        <td>${item._book_id}</td>
                                                        <td>${item._book_name}</td>
                                                        <td>${item._date_expire}</td>
                                                        <td>${item._date_return != null ? item._date_return : 'Pending'}</td>
                                                        <td>$${item._fee}</td>
                                                        <td>$${item._fine != null ? item._fine : '0.0'}</td>
                                                        <td>${item._description}</td>
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
                                                        <td><a href="book_detail.jsp?id=${item._id}">Extend</a></td>
                                                        <td><a href="book_detail.jsp?id=${item._id}">Return</a></td>
                                                        <td><a class="text-danger" href="book_detail.jsp?id=${item._id}">Lost!</a></td>
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
                </div>
            </div>

            <!--Button-->

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
        <script src="http://localhost:8080/ProjectLibrary/js/bootstrap-select.js"></script>
        <script>
            var today = new Date();
            var year = today.getFullYear();
            document.getElementById("input_year").setAttribute("max", year);
            $('[type=reset]').click(function () {
                $('.selectpicker').selectpicker('render');
            });
            $('#dataTable').DataTable({
                fixedColumn: true,
                pageLength: 5,
                lengthMenu: [5, 10, 20, 50]
            });
        </script>
    </body>

</html>

