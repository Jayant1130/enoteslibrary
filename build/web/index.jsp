<%@page import="java.util.List"%>
<%@page import="Model.Enotes"%>
<%@page import="Model.User"%>
<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    int UserID = 0;
    User u = null;
    if (session.getAttribute("Login") != null) {
        UserID = (Integer) session.getAttribute("Login");
        u = d.getUserByID(UserID);
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
<body onload=" pog = setInterval(progress, 10); setInterval(StartSlider, 30);">
    <!--<div class="loader" id="loader" style="display:'none'">	<img src="img/Logo1.png">  </div>-->
    <div class="progressbar" id="progressdiv" style="display:none">
        <div class="progressbarper" id="progressbarper" style="width: 0;">		</div>
    </div> 
    <%@include file="nav.jsp" %>
    <div class="main">
        <div class="card1out" id="card1out" onload="">

            <div class=" card1 Page0" id="Page0" >
                <div class="card1text">!!! WELCOME !!!<br>E-Notes Library<br>Get Any Type of ENotes </div>
                <div class="getmyenotesdiv">
                    <div class="getmyenotes" onclick="window.scroll({top: 770, behavior: 'smooth'});">GET My E-NOTES <br> <arrow>&#8595;</arrow></div>
                </div>
            </div>
        </div>
        <div class="cardsliderline" >
            <div class = "line line1" id="line1"></div>
            <div class = "line line2" id="line2"></div>
            <div class = "line line3" id="line3"></div>
        </div>
        <div class="card2">
            <div class="card2content">
                A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.
            </div>
            <div class="card2image">
                <img src="img/Logo1.png">
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
<script src="js/index.js"></script>
