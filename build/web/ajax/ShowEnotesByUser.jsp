<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Enotes"%>
<%@page import="DAO.Dao"%>
<div class="model right" style="align-items: center;display: flex;flex-direction: column;overflow-y: scroll;">
    <div class="Head">E-Notes</div>
    <%
        Dao d = new Dao();
        List<Enotes> enotes = d.getAllEnotesByUserID(Integer.parseInt(request.getParameter("UserID")));
        for (Enotes e : enotes) {

    %>
    <div class="Notes-card" onclick="window.location.href='./enotes.jsp?EnotesID=<%=e.getEnotesid()%>'">
        <div class="Notes-Name" ><%=e.getName()%></div>
        <div class="Notes-Image" ><img src="<%=e.getRLogo()%>"></div>
        <div class="Notes-Provider" ><%=d.getUserByID(e.getUserid()).getName()%></div>
        <div class="Notes-decription" ><%=e.getDescription()%></div>
    </div>
    <%
    }
    %>
</div>
