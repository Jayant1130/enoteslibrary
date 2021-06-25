        <%@page import="Model.User"%>
<%@page import="DAO.Dao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Enotes"%>
<%
    Dao d = new Dao();
    int UserID = 0;
    User u = null;
    if (session.getAttribute("Login") != null) {
        UserID = (Integer) session.getAttribute("Login");
        u = d.getUserByID(UserID);
    }
    if(request.getParameter("SerachKey").equals("")){
    }else{

%>

<div class="card3 serachcard" id="card3">
            <div class="card31" >
                <div class="card31-heading" >
                    Latest E-Notes
                </div>
                <div class="card31-content" >
                    <%                
                        List<Enotes> enotes = d.getAllEnotesForSearch(request.getParameter("SerachKey"));
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
                        <%
                        }
                        %>
