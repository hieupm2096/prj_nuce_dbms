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
            <c:forEach begin="1" end="${param.txtQuantity}">
                <sql:update dataSource="${db}" var="insert_book">
                    EXEC insert_book ?, ?, ?, ?, ?, ?
                    <sql:param value="${param.txtName}" />
                    <sql:param value="${param.txtYear}" />
                    <sql:param value="${param.txtPrice}" />
                    <sql:param value="${param.txtPublisher}" />
                    <sql:param value="${currentSession._id}" />
                    <sql:param value="${param.txtDescription}" />
                </sql:update>
                <sql:query dataSource="${db}" var="get_current_book_id">
                    EXEC get_current_book_id
                </sql:query>
                <c:forEach var="item" items="${get_current_book_id.rows}">
                    <c:set var="currentId" value="${item._id}" />
                </c:forEach>
                <c:forEach var="item" items="${paramValues.slCate}">
                    <sql:update dataSource="${db}" var="insert_book_cate">
                        EXEC insert_book_cate ?, ?
                        <sql:param value="${currentId}" />
                        <sql:param value="${item}" />
                    </sql:update>
                </c:forEach>
                <c:forEach var="item" items="${paramValues.slAuthor}">
                    <sql:update dataSource="${db}" var="insert_book_author">
                        EXEC insert_book_author ?, ?
                        <sql:param value="${currentId}" />
                        <sql:param value="${item}" />
                    </sql:update>
                </c:forEach>
            </c:forEach>
        </c:catch>
        <c:choose>
            <c:when test="${e != null}">
                <c:redirect url="book_add.jsp">
                    <c:param name="fail" value="fail" />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:redirect url="book_add.jsp?id=${param.id}">
                    <c:param name="success" value="success" />
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </c:when>

    <c:when test="${param.ac == 'ud'}">
        <c:catch var="e">
            <sql:update dataSource="${db}" var="update_book_detail">
                EXEC update_book_detail ?, ?, ?, ?, ?, ?
                <sql:param value="${param.id}" />
                <sql:param value="${param.txtName}" />
                <sql:param value="${param.txtYear}" />
                <sql:param value="${param.txtPrice}" />
                <sql:param value="${param.txtPublisher}" />
                <sql:param value="${param.txtDescription}" />
            </sql:update>
            <sql:update dataSource="${db}" var="remove_book_cate">
                EXEC remove_book_cate ?
                <sql:param value="${param.id}" />
            </sql:update>
            <c:forEach var="item" items="${paramValues.slCate}">
                <sql:update dataSource="${db}" var="insert_book_cate">
                    EXEC insert_book_cate ?, ?
                    <sql:param value="${param.id}" />
                    <sql:param value="${item}" />
                </sql:update>
            </c:forEach>
            <sql:update dataSource="${db}" var="remove_book_author">
                EXEC remove_book_author ?
                <sql:param value="${param.id}" />
            </sql:update>
            <c:forEach var="item" items="${paramValues.slAuthor}">
                <sql:update dataSource="${db}" var="insert_book_author">
                    EXEC insert_book_author ?, ?
                    <sql:param value="${param.id}" />
                    <sql:param value="${item}" />
                </sql:update>
            </c:forEach>
            <c:choose>
                <c:when test="${update_book_detail > 0 && remove_book_cate > 0 && insert_book_cate > 0 && remove_book_author > 0 && insert_book_author > 0}">
                    <c:redirect url="book_detail.jsp?id=${param.id}">
                        <c:param name="success" value="success" />
                    </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="book_detail.jsp?id=${param.id}">
                        <c:param name="fail" value="fail" />
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:catch>
        <c:if test="${e != null}">
            <c:redirect url="book_detail.jsp?id=${param.id}">
                <c:param name="fail" value="fail" />
            </c:redirect>
        </c:if>
    </c:when>

</c:choose>