<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>Enter Book Window</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/myStyle.css.css" rel="stylesheet">

</head>
<body>

<div class="body-container">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="col-md-12">
                <br/>
                <h1>Edit Book</h1>
                <br/>
            </div>
        </div>

        <div class="row-fluid">
            <div class="col-md-12">

                <c:url var="addActionEdit" value="/books/edit">
                    <c:param name="page" value="${pageNumber}"/>
                </c:url>

                <form:form action="${addActionEdit}" commandName="book">
                    <table class="tg">
                        <tr>
                            <td>
                                <form:label path="id">
                                    <spring:message text="ID" /> </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" disabled="true" />
                                <form:hidden path="id" /> </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="author">
                                    <spring:message text="Author" /> </form:label>
                            </td>
                            <td>
                                <form:input path="author" readonly="true" disabled="true" />
                                <form:hidden path="author" /> </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="readAlready">
                                    <spring:message text="Was readed" /> </form:label>
                            </td>
                            <td>
                                <%--<c:if test="${book.readAlready == true}">--%>
                                    <%--${book.readAlready == false}--%>
                                <%--</c:if>--%>
                                <form:input path="readAlready" readonly="true" disabled="true" />
                                <form:hidden path="readAlready" /> </td>
                        </tr>
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
                                <div class="row-fluid" style="margin-top: 10px">
                                    <div class="col-md-6">
                                        <input type="submit"
                                               value="<spring:message text="Edit Book"/>"
                                               class="btn btn-success"/>

                                    </div>

                                    <div class="col-md-6">
                                        <a href="
                                                <c:url value="/books">
                                                    <c:param name="page" value="${pageNumber}"/>
                                                </c:url>
                                                " class="btn btn-warning">Cancel</a>
                                    </div>
                                </div>

                            </td>

                        </tr>

                    </table>
                </form:form>
            </div>
        </div>
    </div>
</div>


<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.js"></script>

</body>
</html>


