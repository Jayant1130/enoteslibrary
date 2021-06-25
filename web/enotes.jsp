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
    <link rel="stylesheet" href="css/enotes.css" />
        <script      src="js/a076d05399.js"    ></script></head>
</head>
<!--loaded();-->
<body onload=" pog = setInterval(progress, 10);">
    <div class="progressbar" id="progressdiv" style="display:none">
        <div class="progressbarper" id="progressbarper" style="width: 0;">		</div>
    </div> 
    <%
    Enotes em = d.getEnotesByEnotesID(Integer.parseInt(request.getParameter("EnotesID")));
    
    %>
    <%@include file="nav.jsp" %>
    <div class="main">
      	<div class="enotesdetail">
	<div class="enotesdetail-p1">
			<div class="profile-logo">
                            <img src="<%=em.getRLogo()%>">
			</div>
		<div class="enotesdetail-Name">
		<%=em.getName()%>
		</div>
		<div class="enotesdetail-Description">
		<%=em.getDescription()%>
		</div>
		</div>
	<div class="enotesdetail-p2">
		<a  href="./ShowPDF.jsp?q=<%=em.getEnotesid()%>" target="_blank" ><div class="enotesdetail-optionView">
		<i class="fas fa-list-ol" onclick=""></i>&nbsp;&nbsp;&nbsp;&nbsp;View
		</div>
                </a>
                <a  href="./ShowPDF.jsp?q=<%=em.getEnotesid()%>" target="_blank" >
		<div class="enotesdetail-optionDownload">
		<i class="fas fa-download"></i>&nbsp;&nbsp;&nbsp;&nbsp;Download
		</div>
                </a>
		</div>
	
	</div>
	<div class="card3" id="card3">
            <div class="card31" >
                <div class="card31-heading" >
                    Latest E-Notes
                </div>
                <div class="card31-content" >
                    <%                        
                        List<Enotes> enotes = d.getAllEnotes();
                        for (Enotes e : enotes) {
                            String c = null;
                            if (UserID == 0) {
                                c = "alert('Login  Required......')";
                            } else {
                                c = "window.location.href = './enotes.jsp?EnotesID=" + e.getEnotesid()+"'";
                            }
                    %>
                    <div class="Notes-card" onclick="<%=c%>">
                        <div class="Notes-Name" ><%=e.getName()%> </div>
                            <div class ="Notes-Image" ><img src="<%=e.getRLogo()%>"></div>
                            <div class="Notes-Provider" ><%=d.getUserByID(e.getUserid()).getName()%></div>
                            <div class="Notes-decription" ><%=e.getDescription()%></div>
                        </div>
                        <%
                            }
                        %>            

                    </div>
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
