<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    int UserID = 0;
    User u = null;
    if (session.getAttribute("Login") != null) {
        UserID = (Integer) session.getAttribute("Login");
        u = d.getUserByID(UserID);
    } else {
        response.sendRedirect("./index.jsp");
    }


%>
<html>
    <head>
        <title>E-Notes Library</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel = "icon" href = "img/icon.ico"         type = "image/x-icon">
        <!-- custom css  -->
        <link rel="stylesheet" href="css/style.css" />
        <script      src="js/a076d05399.js"    ></script></head>
</head>
<!--loaded();-->
<body onload=" pog = setInterval(progress, 10);">
    <div class="progressbar" id="progressdiv" style="display:none">
        <div class="progressbarper" id="progressbarper" style="width: 0;">		</div>
    </div> 
    <%@include file="nav.jsp" %>
    <div class="main">
<div class="msg">
        <%        int msgid = Integer.parseInt(request.getParameter("msgid"));
            if (msgid == 1) {
        %>
    Currently, Your account is under review or requested at admin side. You can use your Institutional  account after approval of admin.        
        <%
    }else if(msgid==2){
        %>
Currently, Your account is temporarily deactivated by admin. Please contact admin to activate your account.
      <%  }
        %>
    <br>                
    <br>                
    <a href="./"  class="dashbutton">Home</a>
                    <br>
                    <br>
                    <a href="./logout.jsp" style="background-color: red;" class="dashbutton">Logout</a>

</div> 

    </div>

    <div class="footer">
        <button onclick="topFunction()" id="myBtn" title="Go to top">&#8593;</button>
        All Right Reserve &#169; Copyright <br><!--Developed By Himanshu Bisht, Jayant Prajapat & Kanchan Pal-->
    </div>

</body>
</html>
<script src="js/script.js"></script>
