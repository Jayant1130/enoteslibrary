<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    int enotesID = Integer.parseInt(request.getParameter("EnotesID"));
    d.DeleteEnotes(enotesID);
    response.sendRedirect("./InstitutionDashboard.jsp");
%>