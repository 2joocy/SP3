<%-- 
    Document   : newjsp
    Created on : 07-09-2016, 19:39:37
    Author     : William-PC
--%>


<%@page import="entities.User"%>
<%@page import="DB.frontHandler"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
<%
    User temp = (User) session.getAttribute("user");
%>
<div class="jumbotron">
  <div class="container text-center">
    <h1>SP3</h1>
    
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">SP3</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="firstPage.jsp">Make A Cupcake</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <%
                            if (session.getAttribute("username") == null) {
                        %>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                            <%
                            } else {
                            %>

                        <li><a href="billing.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>

                        <%
                            }
                        %>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li><a href="#"><span class=""></span>Balance: <% out.print(temp.balance); %></a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
    <h2>Topping:</h2>
  <%
      frontHandler fr = new frontHandler();
      out.print(fr.writeTopping());
  %>
  </div>
 
<br><br>

<footer class="container-fluid text-center">
  
</footer>

</body>
</html>
