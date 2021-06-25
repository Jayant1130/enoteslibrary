<%@page import="Model.Enotes"%>
<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    Enotes e = new Enotes();
    e.setEnotesid(Integer.parseInt(request.getParameter("EnotesID")));
    e.setName(request.getParameter("Name"));
    e.setDescription(request.getParameter("Description"));
    d.updateEnotes(e);
    response.sendRedirect("./InstitutionDashboard.jsp");
%>