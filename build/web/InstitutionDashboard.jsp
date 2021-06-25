<%@page import="Model.Enotes"%>
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
        <div class="Head">Institution Dashboard</div>
        <div class="I">
            <div class="IOption">
                <div class="Head"><i class="fab fa-elementor"></i><div class="buttonhide">Institution Operation</div></div>
                <div class="Option" onclick="openModel('AddModel')"><i class="fas fa-plus"></i><div class="buttonhide option1">Add E-Notes</div></div>
                <div class="Option" onclick="window.location.href = './logout.jsp'"><i class="fas fa-sign-out-alt"></i><div class="buttonhide option1">Logout</div></div>
            </div>
            <div class="IMain">
                <div class="IHead">E-Notes Detail</div>
                <div class="IList-Scroll">
                    <div class="IList">
                        <div class="IList-row Header">
                            <div class="IList-data sr">#</div>
                            <div class="IList-data dlogo">Logo</div>
                            <div class="IList-data name">Name</div>
                            <div class="IList-data des">Description</div>
                            <div class="IList-data Dbutton">View</div>
                            <div class="IList-data Dbutton">Update</div>
                            <div class="IList-data Dbutton">Delete</div>
                        </div>
                        <%                            List<Enotes> enotes = d.getAllEnotesByUserID(UserID);
                            int i = 0;
                            for (Enotes e : enotes) {
                                i++;

                        %>
                        <div class="IList-row">
                            <div class="IList-data sr"><%=i%></div>
                            <div class="IList-data dlogo"><img src="<%=e.getRLogo()%>"></div>
                            <div class="IList-data name"><%=e.getName()%></div>
                            <div class="IList-data des"><%=e.getDescription()%></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton View" onclick="ViewEnotesModel(<%=e.getEnotesid()%>)"><i class="far fa-eye"></i><div class="buttonhide">View</div></button></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton Update" onclick="UpdateEnotesModel(<%=e.getEnotesid()%>)"><i class="fas fa-pen"></i><div class="buttonhide">Update</div></button></div>
                            <div class="IList-data Dbutton"><button href="#" class="Tbutton Delete" onclick="DeleteEnotesModel(<%=e.getEnotesid()%>)"><i class="fas fa-minus-circle"></i><div class="buttonhide">Delete</div></button></div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modelback " id="EnotesModel" onclick="closeModel(event, 'EnotesModel')">
        <div class="model right">
            <form>
                <div class="right-Condiv-Heading">E-Notes</div>
                <div class="profile-logo">
                    <img src="img/Logo.png">
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Name</div>
                    <div class="right-Condiv-fieldInput"><Input type="text"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Description</div>
                    <div class="right-Condiv-fieldInput" style="height:71px"><textarea type="textarea" rows="4" ></textarea></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldInput">
                        <Input type="Button" id="Verification" value="Delete E-Notes"></div>
                </div>
            </form>
        </div>
    </div>
    
    <div class="modelback " id="AddModel" onclick="closeModel(event, 'AddModel')">
        <div class="model right">
            <form action="Addenotes" method="post" enctype="multipart/form-data">
                <Input type="hidden" value="<%=UserID%>" name="UserID">
                <div class="right-Condiv-Heading">Add E-Notes</div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Logo</div>
                    <div class="right-Condiv-fieldInput"><Input type="file" name="Logo"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Name</div>
                    <div class="right-Condiv-fieldInput"><Input type="text" name="Name"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Description (HTML Enabled)</div>
                    <div class="right-Condiv-fieldInput" style="height:71px"><textarea type="textarea" rows="4" name="Description" ></textarea></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Document</div>
                    <div class="right-Condiv-fieldInput"><Input type="file" name="Document"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldInput">
                        <Input type="submit" id="Verification" value="Add E-Notes"></div>
                </div>
            </form>
        </div>
    </div>

</div>

<div class="footer">
    <button onclick="topFunction()" id="myBtn" title="Go to top">&#8593;</button>
    All Right Reserve &#169; Copyright <br><!--Developed By Himanshu Bisht, Jayant Prajapat & Kanchan Pal-->
</div>

</body>
</html>
<script src="js/script.js"></script>
<script src="js/index.js"></script>
<script src="js/institution.js"></script>
