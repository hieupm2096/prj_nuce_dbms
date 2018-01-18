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

