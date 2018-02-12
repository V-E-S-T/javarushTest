<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <meta charset="UTF-8">
  <title>BookManager</title>

  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
  <link href="/resources/css/myStyle.css" rel="stylesheet">


</head>
<body>
<div class="body-container">
  <div class="row-fluid">
     <div class="col-md-12">
       <h3>Test task "BookManager" JavaRush</h3>
       <br/>
       <a href="<c:url value="/books"/>" class="btn btn-warning">Books list</a>
       <br/>
     </div>
  </div>
</div>


<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
</body>
</html>