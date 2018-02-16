<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Books Page</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link href="/resources/css/myStyle.css" rel="stylesheet">

</head>
<body>
    <div class="body-container">

        <div class="container-fluid book_catalog">
            <div class="row-fluid">
                <div class="col-md-2">
                    <a href="../../index.jsp" class="btn btn-warning">Back to main menu</a>
                </div>
            </div>
            <!-- Кнопка, открывающее модальное окно -->
            <div class="row-fluid">
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gridSystemModal" style="margin-top: 30px">
                        Add book
                    </button>
                </div>
            </div>

            <div class="row-fluid">
                <div class="col-md-12">
                    <br/>
                    <h1>Book List</h1>
                    <br/>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-md-12">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPageCount}" var="i">

                            <li><a href="
                                            <c:url value="/books">
                                                     <c:param name="page" value="${i}"/>
                                            </c:url>
                                        ">${i}
                            </a></li>

                        </c:forEach>

                    </ul>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-md-12">
                    <c:if test="${!empty listBooks}">
                        <table class="tg">
                            <tr>
                                <th width="80">ID</th>
                                <th width="120">Title</th>
                                <th width="120">Author</th>
                                <th width="120">Description</th>
                                <th width="120">Print Year</th>
                                <th width="120">ISBN</th>
                                <th width="120">Read Already</th>
                                <th width="100">Edit</th>
                                <th width="120">Mark</th>
                                <th width="60">Delete</th>
                            </tr>
                            <c:forEach items="${listBooks}" var="book">
                                <tr>
                                    <td>${book.id}</td>
                                    <td><a href="/bookdata/${book.id}" target="_blank">${book.title}</a></td>
                                    <td>${book.author}</td>
                                    <td>${book.description}</td>
                                    <td>${book.printYear}</td>
                                    <td>${book.isbn}</td>
                                    <td>${book.readAlready}</td>
                                    <td>
                                        <div class="row-fluid">
                                            <div class="col-md-12">

                                                <a href="<c:url value='/editBook/${book.id}'/>" class="btn btn-info btn-sm">Edit Book</a>

                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <c:if test="${book.readAlready == false}">
                                                    <a href="<c:url value='/editStatus/${book.id}'/>" class="btn btn-info btn-sm">Mark as readed</a>
                                                </c:if>

                                                <c:if test="${book.readAlready == true}">
                                                    <a class="btn btn-danger btn-xs disabled">Book readed</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </td>
                                    <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>



            <!-- Модальное окно, основное содержимое которого организовано с использованием системы сеток Bootstrap 3 или 4 -->
            <div id="gridSystemModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
                            <h4 class="modal-title" id="gridModalLabel">Add book</h4>
                        </div>
                        <div class="modal-body">
                            <!-- основное содержимое (тело) модального окна -->

                            <c:url var="addAction" value="/books/add" />
                            <form:form action="${addAction}" commandName="book">
                                <table>

                                        <tr>
                                            <td>
                                                <form:label path="title">
                                                    <spring:message text="Title" /> </form:label>
                                            </td>
                                            <td>
                                                <form:input path="title" /> </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <form:label path="author">
                                                    <spring:message text="Author" /> </form:label>
                                            </td>
                                            <td>
                                                <form:input path="author" /> </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <form:label path="description">
                                                    <spring:message text="Description" /> </form:label>
                                            </td>
                                            <td>
                                                <form:input path="description" /> </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <form:label path="printYear">
                                                    <spring:message text="PrintYear" /> </form:label>
                                            </td>
                                            <td>
                                                <form:input path="printYear" /> </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <form:label path="isbn">
                                                    <spring:message text="ISBN" /> </form:label>
                                            </td>
                                            <td>
                                                <form:input path="isbn" /> </td>
                                        </tr>
                                    <tr>
                                        <td colspan="2">
                                            <c:if test="${!empty book.title}">
                                                <input type="submit" value="<spring:message text=" Edit Book "/>"/> </c:if>
                                            <c:if test="${empty book.title}">
                                                <input type="submit" value="<spring:message text=" Add Book "/>"/> </c:if>
                                        </td>
                                    </tr>
                                </table>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>

</body>
</html>
