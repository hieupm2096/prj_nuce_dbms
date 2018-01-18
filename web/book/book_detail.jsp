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
        <title>Book Detail</title>
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
                <h1 class="page-header" style="display: inline-block;">Book Detail</h1>
            </div>
            <div class="container-fluid">
                <!-- Form -->
                <div class="card mb-3" style="width: 90%;">
                    <div class="card-header">Book</div>
                    <div class="card-body">
                        <form action="book_controller.jsp?ac=ud&id=${param.id}" method="POST">
                            <!--sql-->
                            <sql:query dataSource="${db}" var="bookRs">
                                EXEC dbo.get_book_detail ?
                                <sql:param value="${param.id}" />
                            </sql:query>
                            <sql:query dataSource="${db}" var="cateRs">
                                EXEC dbo.get_cate
                            </sql:query>
                            <sql:query dataSource="${db}" var="authorRs">
                                EXEC dbo.get_author
                            </sql:query>
                            <c:forEach var="item" items="${bookRs.rows}" varStatus="i">
                                <c:set var="foundBook" value="${item}" />
                            </c:forEach>
                            <div class="row">
                                <div class="form-group col-md-10">
                                    <label>Book Name:</label>
                                    <input name="txtName" type="text" class="form-control" value="${foundBook._name}" required>
                                </div>
                                <div class="form-group col-md-2">
                                    <label>Status:</label>
                                    <c:choose>
                                        <c:when test="${foundBook._status}">
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
                                <div class="form-group col-md-6">
                                    <label>Category:</label>
                                    <select name="slCate" class="form-control selectpicker" multiple data-width="100%" data-live-search="true" data-max-options="5" required>
                                        <c:forEach var="cate" items="${cateRs.rows}" varStatus="i">
                                            <option value="${cate._id}" ${cate._status ? '' : 'disabled'}
                                                    <c:forEach var="book" items="${bookRs.rows}" varStatus="j">
                                                        <c:if test="${book._cate_id == cate._id}">
                                                            <c:out value=" selected" />
                                                        </c:if>
                                                    </c:forEach>
                                                    >
                                                ${cate._name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Author:</label>
                                    <select name="slAuthor" class="form-control selectpicker" multiple data-width="100%" data-live-search="true" data-max-options="5" required>
                                        <c:forEach var="author" items="${authorRs.rows}" varStatus="i">
                                            <option value="${author._id}" ${author._status ? '' : 'disabled'}
                                                    <c:forEach var="book" items="${bookRs.rows}" varStatus="j">
                                                        <c:if test="${book._author_id == author._id}">
                                                            <c:out value=" selected" />
                                                        </c:if>
                                                    </c:forEach>
                                                    >
                                                ${author._name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label>Price:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span>
                                        <input name="txtPrice" class="form-control" type="number" value="${foundBook._price}" step="0.01" min="0" max="999" required>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Year of Publication:</label>
                                    <input id="input_year" name="txtYear" type="number" class="form-control" value="${foundBook._year}" min="1900" required >
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Publisher:</label>
                                    <input name="txtPublisher" type="text" class="form-control" value="${foundBook._publisher}" required>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label>Created Date:</label>
                                    <input name="txtImportDate" class="form-control" type="date" value="${foundBook._date_import}" required disabled >
                                </div>
                                <div class="col-md-2">
                                    <label>Created By:</label>
                                    <div><a href="#" text-align="center">${foundBook._username}</a></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label>Description:</label>
                                    <textarea name="txtDescription" class="form-control" value="${foundBook._description}" rows="3"></textarea>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${not empty param.success}">
                                    <div class="alert alert-success alert-dismissible fade show form-group">
                                        <button type="button" class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        Book updated successfully
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${not empty param.fail}">
                                        <div class="alert alert-danger alert-dismissible fade show form-group">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <span>&times;</span>
                                            </button>
                                            Error: Book has not been updated
                                        </div>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <div style="float: right;">
                                <input type="submit" class="btn btn-outline-primary btn-primary" value="Update">
                                <input type="reset" class="btn btn-outline-primary btn-primary" value="Reset">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
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
        </script>
    </body>

</html>

