<%-- 
    Document   : authenticate
    Created on : Nov 30, 2017, 11:42:28 AM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dbDriver" value="com.microsoft.sqlserver.jdbc.SQLServerDriver"/>
<c:set var="dbUrl" value="jdbc:sqlserver://localhost:1433;databaseName=DbLibrarySystem"/>
<c:set var="dbUsername" value="sa"/>
<c:set var="dbPassword" value="Virgo 209"/>
<sql:setDataSource var="db" driver="${dbDriver}" user="${dbUsername}" password="${dbPassword}" url="${dbUrl}" scope="session" />

<sql:query dataSource="${db}" var="result">
    EXEC dbo.get_librarian ?, ?
    <sql:param value="${param.txtUsername}" />
    <sql:param value="${param.txtPassword}" />
</sql:query>

<c:choose>
    <c:when test="${not empty result}">
        <c:forEach var="item" items="${result.rows}">
            <c:set var="currentSession" value="${item}" scope="session" />
            <c:redirect url="index.jsp" />
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:redirect url="login.jsp">
            <c:param name="errMsg" value="Invalid username or password" />
        </c:redirect>
    </c:otherwise>
</c:choose>