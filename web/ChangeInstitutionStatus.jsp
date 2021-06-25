<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    int UserID = Integer.parseInt(request.getParameter("UserID"));
    String Status = request.getParameter("Status");
    d.changeInstitutionStatus(UserID, Status);
    response.sendRedirect("./AdminDashboard.jsp");
    
    %>