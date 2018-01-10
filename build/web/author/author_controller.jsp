<%-- 
    Document   : cate_controller
    Created on : Nov 30, 2017, 3:14:50 PM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${param.ac == 'add'}">
        <c:catch var="e">
            <sql:update dataSource="${db}" var="result">
                EXEC insert_author ?
                <sql:param value="${param.txtName}" />
            </sql:update>
            <c:choose>
                <c:when test="${result > 0}">
                    <c:redirect url="author_add.jsp">
                        <c:param name="success" value="success" />
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="author_add.jsp">
                        <c:param name="fail" value="fail" />
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:catch>
        <c:if test="${e != null}">
            <c:redirect url="author_add.jsp">
                <c:param name="fail" value="fail" />
            </c:redirect>
        </c:if>
    </c:when>

    <c:when test="${param.ac == 'ud'}">
        <c:catch var="e">
            <c:choose>
                <c:when test="${not empty param.chkStatus}">
                    <c:set var="status" value="1" />
                </c:when>
                <c:otherwise>
                    <c:set var="status" value="0" />
                </c:otherwise>
            </c:choose>
            <sql:update dataSource="${db}" var="result">
                EXEC update_author ?, ?, ?
                <sql:param value="${param.id}" />
                <sql:param value="${param.txtName}" />
                <sql:param value="${status}" />
            </sql:update>
            <c:choose>
                <c:when test="${result > 0}">
                    <c:redirect url="author_ud.jsp?id=${param.id}">
                        <c:param name="success" value="success" />
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="author_ud.jsp?id=${param.id}">
                        <c:param name="fail" value="fail" />
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:catch>
        <c:if test="${e != null}">
            <c:redirect url="author_ud.jsp?id=${param.id}">
                <c:param name="fail" value="fail" />
            </c:redirect>
        </c:if>
    </c:when>

</c:choose>