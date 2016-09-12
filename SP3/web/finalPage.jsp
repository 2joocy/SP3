
<%@page import="entities.User"%>
<%@page import="DB.frontHandler"%>
<%
User temp = (User) request.getSession().getAttribute("user");
%>
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
            
            /* Remove the navbar's default rounded borders and increase the bottom margin */
            .navbar {
                margin-bottom: 50px;
                border-radius: 0;
            }

            body {
                font-family: 'Nunito', sans-serif;
                color: #384047;
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

            *, *:before, *:after {
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            body {
                font-family: 'Nunito', sans-serif;
                color: #384047;
            }

            form {
                max-width: 300px;
                margin: 10px auto;
                padding: 10px 20px;
                background: #f4f7f8;
                border-radius: 8px;
            }

            h1 {
                margin: 0 0 30px 0;
                text-align: center;
            }

            input[type="text"],
            input[type="password"],
            input[type="date"],
            input[type="datetime"],
            input[type="email"],
            input[type="number"],
            input[type="search"],
            input[type="tel"],
            input[type="time"],
            input[type="url"],
            textarea,
            select {
                background: rgba(255,255,255,0.1);
                border: none;
                font-size: 16px;
                height: auto;
                margin: 0;
                outline: 0;
                padding: 15px;
                width: 100%;
                background-color: #e8eeef;
                color: #8a97a0;
                box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                margin-bottom: 30px;
            }

            input[type="radio"],
            input[type="checkbox"] {
                margin: 0 4px 8px 0;
            }

            select {
                padding: 6px;
                height: 32px;
                border-radius: 2px;
            }

            button {
                padding: 19px 39px 18px 39px;
                color: #FFF;
                background-color: #4bc970;
                font-size: 18px;
                text-align: center;
                font-style: normal;
                border-radius: 5px;
                width: 100%;
                border: 1px solid #3ac162;
                border-width: 1px 1px 3px;
                box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
                margin-bottom: 10px;
            }

            fieldset {
                margin-bottom: 30px;
                border: none;
            }

            legend {
                font-size: 1.4em;
                margin-bottom: 10px;
            }

            label {
                display: block;
                margin-bottom: 8px;
            }

            label.light {
                font-weight: 300;
                display: inline;
            }

            .number {
                background-color: #5fcf80;
                color: #fff;
                height: 30px;
                width: 30px;
                display: inline-block;
                font-size: 0.8em;
                margin-right: 4px;
                line-height: 30px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255,255,255,0.2);
                border-radius: 100%;
            }

            @media screen and (min-width: 480px) {

                form {
                    max-width: 480px;
                }

            }
        </style>
    </head>
    <body>


        <div class="jumbotron">
            <div class="container text-center">
                <h1>Online Store</h1>
                <p>Mission, Vission & Values</p>
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
                    <a class="navbar-brand" href="index.jsp">SP3</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="firstPage.jsp">Make A Cupcake</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class=""></span>Balance: <% out.print(temp.balance); %></a></li>
                        <li><a href="orders.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Orders</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <center>
                <fieldset>
                <form method="post" action="process">
                    <h3>Topping:</h3>


                    <%
                        out.print(session.getAttribute("toppingSession"));
                    %>

                    <h3>Price:</h3>

                    <%
                        out.print(session.getAttribute("toppingSessionPrice"));
                    %>
                    <br>

                    <h3>Bottom:</h3>
                    <%
                        out.print(session.getAttribute("bottomSession"));
                    %>
                    <br>

                    <h3>Price:</h3>
                    <%
                        out.print(session.getAttribute("bottomSessionPrice"));
                    %>
                    <br>
                   
                    <h3>Total Price:</h3>
                        <%
                            double finalPrice1 =  (Double) session.getAttribute("bottomSessionPrice")+ (Double) session.getAttribute("toppingSessionPrice");
                            ;
                        %>
                        <br><br>
                        <input type="hidden" name="processOrder" value="order">
                        <%
                                if(finalPrice1 > temp.balance){
                                    out.print("<h3><font color='red'>YOU CANNOT AFFORD THIS PURCHASE! CURRENT BALANCE IS: <br><br>" + temp.balance + "</font></h3><br><button type='submit' disabled>Check Out</button>");
                            }else if(temp.balance > finalPrice1){
                                    out.print("<button type='submit'>Check Out</button>");
                            }
                        %>
                </form>
                </fieldset>
            </center>
        </div>
        <br><br>



    </body>
</html>