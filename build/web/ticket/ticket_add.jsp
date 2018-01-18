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
                        <a class="nav-link" href="../reader/reader_list.jsp">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Readers</span>
                        </a>
                    </li>

                    <!-- Ticket Manager -->
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tickets">
                        <a class="nav-link" href="../ticket/ticket_list.jsp" style="color: white;">
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
                <h1 class="page-header" style="display: inline-block;">Create New Ticket</h1>
            </div>
            <div class="container-fluid">
                <!-- Form -->

                <div class="card-body">
                    <form action="ticket_controller.jsp?ac=add" method="POST">
                        <!--add reader-->
                        <div class="card mb-3">
                            <div class="card-header">Reader</div>

                            <!--modal-->
                            <div id="add-reader" class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Choose Reader</h5>
                                        </div>
                                        <div class="modal-body">
                                            <jsp:include page="ticket_add_choose_reader.jsp" />
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="card-body">
                                <!--query reader-->
                                <c:if test="${param.rid != null}">
                                    <sql:query dataSource="${db}" var="result" maxRows="1">
                                        EXEC get_reader ?, NULL, NULL, NULL, 1
                                        <sql:param value="${param.rid}" />
                                    </sql:query>
                                </c:if>
                                <c:forEach var="item" items="${result.rows}">
                                    <c:set var="foundReader" value="${item}" />
                                </c:forEach>
                                <div class="row">
                                    <div class="form-group col-md-2">
                                        <label>Reader ID:</label>
                                        <input id="reader-id" name="txtReaderId" type="text" class="form-control reader-input" value="${foundReader._id}" required readonly />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Reader Name:</label>
                                        <input type="text" class="form-control reader-input" value="${foundReader._name}" required readonly/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Email Address:</label>
                                        <input type="email" class="form-control reader-input" value="${foundReader._email}" required readonly/>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Phone:</label>
                                        <input type="text" class="form-control reader-input" pattern="\d*" value="${foundReader._phone}" readonly/>
                                    </div>
                                </div>

                                <div style="float: right;">
                                    <button type="button" class="btn btn-outline-secondary btn-primary" data-toggle="modal" data-target="#add-reader">Add</button>
                                    <button type="button" id="btn-reader-reset" class="btn btn-outline-secondary btn-primary">Reset</button>
                                </div>
                            </div>
                        </div>

                        <!--add book-->
                        <div class="card mb-3">
                            <div class="card-header">Books</div>

                            <!--modal-->
                            <div id="add-book" class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Choose Books</h5>
                                        </div>
                                        <div class="modal-body">
                                            <jsp:include page="ticket_add_choose_book.jsp" />
                                        </div>
                                        <div class="modal-footer">
                                            <button id="btn-choose-book" type="button" class="btn btn-secondary" data-dismiss="modal">Choose</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body">
                                <!--query book-->
                                <c:if test="${param.bid1 != null}">
                                    <sql:query dataSource="${db}" var="result1">
                                        EXEC get_book_detail_for_create_ticket ?, ?, ?
                                        <sql:param value="${param.bid1}" />
                                        <sql:param value="${param.bid2}" />
                                        <sql:param value="${param.bid3}" />
                                    </sql:query>
                                </c:if>
                                <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                    <col width="10%">
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="10%">
                                    <col width="30%">
                                    <thead>
                                        <tr>
                                            <th>Book ID</th>
                                            <th>Book Name</th>
                                            <th>Date Expire</th>
                                            <th>Fee</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${result1.rows}" varStatus="i">
                                            <tr>
                                                <td>${item._id}</td>
                                                <td>${item._name}</td>
                                                <td>
                                                    <input width="100%" class="form-control" name="txtDateExpire${i.count}" type="date" required>
                                                </td>
                                                <td>$<span class="fee-value"></span></td>
                                                <td>
                                                    <input width="100%" class="form-control" name="txtDescription${i.count}" type="text">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <div style="float: right;">
                                    <button type="button" class="btn btn-outline-secondary btn-primary" data-toggle="modal" data-target="#add-book">Add</button>
                                    <button type="button" id="btn-book-reset" class="btn btn-outline-secondary btn-primary">Reset</button>
                                </div>
                            </div>
                        </div>

                        <div style="float: right;">
                            <input type="submit" class="btn btn-lg btn-outline-primary btn-primary" value="Create" style="margin-right: 20px; margin-bottom: 20px;">
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!--Button-->
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
        <script src="http://localhost:8080/ProjectLibrary/vendor/jquery/jquery.min.js"></script>
        <script src="http://localhost:8080/ProjectLibrary/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="http://localhost:8080/ProjectLibrary/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->

        <script src="http://localhost:8080/ProjectLibrary/vendor/datatables/jquery.dataTables.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="http://localhost:8080/ProjectLibrary/js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script src="../js/bootstrap-select.js"></script>

        <script>
            $(function () {
                $("#btn-reader-reset").click(function () {
                    $(".reader-input").each(function () {
                        $(this).val("");
                    });
                });
                $('#btn-choose-book').click(function () {
                    var url = window.location.href;
                    var pattern = 'ticket_add.jsp$';
                    var regex = new RegExp(pattern);
                    if (!regex.test(url)) {
                        var pattern1 = /(?:&*bid\d+=\d+)+&*/g;
                        url = url.replace(pattern1, "");
                    }
                    pattern = 'rid';
                    regex = new RegExp(pattern);
                    if (regex.test(url)) {
                        url += '&';
                    } else {
                        url += '?';
                    }
                    $(':checkbox:checked').each(function (index) {
                        if (index < ($(':checkbox:checked').length - 1)) {
                            url += 'bid' + (index + 1) + '=' + $(this).val() + '&';
                        } else {
                            url += 'bid' + (index + 1) + '=' + $(this).val();
                        }
                    });
                    window.location = url;
                });
                var today = new Date();
                var temp = today.getTime() + 1000 * 60 * 60 * 24 * 14; // Offset by one day;
                var maxDate = new Date();
                maxDate.setTime(temp);
                function dateToString(date) {
                    var dd = date.getDate();
                    var mm = date.getMonth() + 1;
                    var yyyy = date.getFullYear();
                    if (dd < 10) {
                        dd = '0' + dd;
                    }
                    if (mm < 10) {
                        mm = '0' + mm;
                    }
                    return yyyy + '-' + mm + '-' + dd;
                }
                ;
                var todayStr = dateToString(today);
                var maxDateStr = dateToString(maxDate);
                $('input[type="date"').each(function (i) {
                    $(this).prop('min', todayStr);
                    $(this).prop('max', maxDateStr);
                    $(this).on('change', function () {
                        console.log(i);
                        var expireDate = new Date($(this).val());
                        var diff = new Date(expireDate - today);
                        var numOfDays = Math.round(diff / 1000 / 60 / 60 / 24);
                        console.log(numOfDays);
                        $('.fee-value').each(function (j) {
                            if (i === j) {
                                if (isNaN(numOfDays)) {
                                    numOfDays = 0;
                                }
                                $(this).text((numOfDays * 0.3).toFixed(2));
                            }
                        });
                    });
                });
            });
        </script>
    </body>

</html>

