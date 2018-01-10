<%-- 
    Document   : login
    Created on : Nov 30, 2017, 11:22:21 AM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${empty currentSession}">
        <!DOCTYPE html>
        <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="">
                <meta name="author" content="">
                <title>Login Page</title>
                <!-- Bootstrap core CSS-->
                <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <!-- Custom fonts for this template-->
                <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
                <!-- Custom styles for this template-->
                <link href="css/sb-admin.css" rel="stylesheet">
            </head>

            <body class="bg-dark">
                <div class="container">
                    <div class="card card-login mx-auto mt-5">
                        <div class="card-header">Login</div>
                        <div class="card-body">
                            <form action="authenticate.jsp" method="POST">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input name="txtUsername" class="form-control" type="text" placeholder="Enter username">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input name="txtPassword" class="form-control" type="password" placeholder="Password">
                                </div>
                                <input class="btn btn-primary btn-block" type="submit" value="Login">
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Bootstrap core JavaScript-->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <!-- Core plugin JavaScript-->
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            </body>

        </html>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp" />
    </c:otherwise>
</c:choose>
