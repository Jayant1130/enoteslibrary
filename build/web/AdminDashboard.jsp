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
        <link rel="stylesheet" href="css/Institution.css" />
        <link rel="stylesheet" href="css/Admin.css" />
        <script      src="js/a076d05399.js"    ></script></head>
</head>
<!--loaded();-->
<body onload=" pog = setInterval(progress, 10);">
    <div class="progressbar" id="progressdiv" style="display:none">
        <div class="progressbarper" id="progressbarper" style="width: 0;">		</div>
    </div> 
    <%@include file="nav.jsp" %>
    <div class="main">
        <div class="Head">Admin Dashbaord</div>
        <div class="I">
            <div class="IOption">
                <div class="Head"><i class="fab fa-elementor"></i><div class="buttonhide">Admin Operation</div></div>
                <div class="Option" onclick="window.location.href='./logout.jsp'"><i class="fas fa-sign-out-alt"></i><div class="buttonhide option1">Logout</div></div>

            </div>
            <div class="IMain">
                <div class="IHead">Institution Detail</div>
                <div class="IList-Scroll">
                    <div class="IList">
                        <div class="IList-row Header">
                            <div class="IList-data sr">#</div>
                            <div class="IList-data name">Name</div>
                            <div class="IList-data email">E-Mail</div>
                            <div class="IList-data mob">Mobile</div>
                            <div class="IList-data Dbutton">E-Notes</div>
                            <div class="IList-data status">Status</div>
                            <div class="IList-data Dbutton">Operation</div>
                        </div>
                        <%                            int i = 0;
                            List<User> users = d.getAllUserByType("Requested");
                            for (User user : users) {
                                i++;
                        %>
                        <div class="IList-row">
                            <div class="IList-data sr"><%=i%></div>
                            <div class="IList-data name"><%=user.getName()%></div>
                            <div class="IList-data email"><%=user.getEmail()%></div>
                            <div class="IList-data mob"><%=user.getMobile()%></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton View" onclick="ShowEnotesByUser(<%=user.getUserID()%>)"><i class="fas fa-list-ol"></i><div class="buttonhide">View</div></button></div>
                            <div class="IList-data status" style="color:Orange"><%=user.getType()%></div>
                            <div class="IList-data Dbutton"><a href="./ChangeInstitutionStatus.jsp?UserID=<%=user.getUserID()%>&Status=Institution" class="Tbutton View" ><i class="fas fa-vote-yea"></i><div class="buttonhide">Accept</div></a></div>
                        </div>
                        <%
                            }
                            users = d.getAllUserByType("Institution");
                            for (User user : users) {
                                i++;
                        %>
                        <div class="IList-row">
                            <div class="IList-data sr"><%=i%></div>
                            <div class="IList-data name"><%=user.getName()%></div>
                            <div class="IList-data email"><%=user.getEmail()%></div>
                            <div class="IList-data mob"><%=user.getMobile()%></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton View" onclick="ShowEnotesByUser(<%=user.getUserID()%>)"><i class="fas fa-list-ol"></i><div class="buttonhide">View</div></button></div>
                            <div class="IList-data status" style="color:Green"><%=user.getType()%></div>
                            <div class="IList-data Dbutton"><a href="./ChangeInstitutionStatus.jsp?UserID=<%=user.getUserID()%>&Status=Deactive" class="Tbutton Delete" ><i class="fas fa-times-circle"></i><div class="buttonhide">Deactive</div></a></div>
                        </div>
                        <%
                            }
                            users = d.getAllUserByType("Deactive");
                            for (User user : users) {
                                i++;
                        %>
                        <div class="IList-row">
                            <div class="IList-data sr"><%=i%></div>
                            <div class="IList-data name"><%=user.getName()%></div>
                            <div class="IList-data email"><%=user.getEmail()%></div>
                            <div class="IList-data mob"><%=user.getMobile()%></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton View" onclick="ShowEnotesByUser(<%=user.getUserID()%>)"><i class="fas fa-list-ol"></i><div class="buttonhide">View</div></button></div>
                            <div class="IList-data status" style="color:Red"><%=user.getType()%></div>
                            <div class="IList-data Dbutton"><a href="./ChangeInstitutionStatus.jsp?UserID=<%=user.getUserID()%>&Status=Institution" class="Tbutton View" ><i class="fas fa-vote-yea"></i><div class="buttonhide">Active</div></a></div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="modelback " id="EnotesByUser" onclick="closeModel(event, 'EnotesByUser')">
        
    </div>

    <div class="footer">
        <button onclick="topFunction()" id="myBtn" title="Go to top">&#8593;</button>
        All Right Reserve &#169; Copyright <br><!--Developed By Himanshu Bisht, Jayant Prajapat & Kanchan Pal-->
    </div>

</body>
</html>
<script src="js/script.js"></script>
<script src="js/index.js"></script>
<script src="js/admin.js"></script>
