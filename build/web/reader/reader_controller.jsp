<%-- 
    Document   : reader_controller
    Created on : Dec 9, 2017, 11:29:47 PM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${param.ac == 'add'}">
        <c:catch var="e">
            <sql:update dataSource="${db}" var="result">
                EXEC insert_reader ?, ?, ?, ?, ?, ?
                <sql:param value="${param.txtName}" />
                <sql:param value="${param.txtEmail}" />
                <sql:param value="${param.txtPhone}" />
                <sql:param value="${param.txtDob}" />
                <sql:param value="${param.slGender}" />
                <sql:param value="${param.txtAddress}" />
            </sql:update>
            <c:choose>
                <c:when test="${result > 0}">
                    <c:redirect url="reader_add.jsp">
                        <c:param name="success" value="success" />
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="reader_add.jsp">
                        <c:param name="fail" value="fail" />
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:catch>
        <c:if test="${e != null}">
            <c:redirect url="reader_add.jsp">
                <c:param name="fail" value="fail" />
            </c:redirect>
        </c:if>
    </c:when>

    <c:when test="${param.ac == 'ud'}">
        <c:choose>
            <c:when test="${not empty param.chkStatus}">
                <c:set var="status" value="1" />
            </c:when>
            <c:otherwise>
                <c:set var="status" value="0" />
            </c:otherwise>
        </c:choose>
        <c:catch var="e">
            <sql:update dataSource="${db}" var="result">
                EXEC update_reader ?, ?, ?, ?, ?, ?, ?, ?
                <sql:param value="${param.id}" />
                <sql:param value="${param.txtName}" />
                <sql:param value="${param.txtEmail}" />
                <sql:param value="${param.txtPhone}" />
                <sql:param value="${param.txtDob}" />
                <sql:param value="${param.slGender}" />
                <sql:param value="${param.txtAddress}" />
                <sql:param value="${status}" />
            </sql:update>
            <c:choose>
                <c:when test="${result > 0}">
                    <c:redirect url="reader_ud.jsp?id=${param.id}">
                        <c:param name="success" value="success" />
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="reader_ud.jsp?id=${param.id}">
                        <c:param name="fail" value="fail" />
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:catch>
        <c:if test="${e != null}">
            <c:redirect url="reader_ud.jsp?id=${param.id}">
                <c:param name="fail" value="fail" />
            </c:redirect>
        </c:if>
    </c:when>

</c:choose>
