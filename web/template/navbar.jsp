<%-- 
    Document   : navbar
    Created on : Jan 12, 2018, 2:23:24 AM
    Author     : oswal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.jsp">Library Manger</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="http://localhost:8080/ProjectLibrary/index.jsp">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">Dashboard</span>
                </a>
            </li>

            <!-- Book Manager -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-wrench"></i>
                    <span class="nav-link-text">Books</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseComponents">
                    <li>
                        <a href="http://localhost:8080/ProjectLibrary/category/cate_list.jsp">Category</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/ProjectLibrary/author/author_list.jsp">Author</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/ProjectLibrary/book/book_list.jsp">Book</a>
                    </li>
                </ul>
            </li>

            <!-- Reader Manager -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Readers">
                <a class="nav-link" href="http://localhost:8080/ProjectLibrary/reader/reader_list.jsp">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">Readers</span>
                </a>
            </li>

            <!-- Ticket Manager -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tickets">
                <a class="nav-link" href="http://localhost:8080/ProjectLibrary/ticket/ticket_list.jsp">
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
