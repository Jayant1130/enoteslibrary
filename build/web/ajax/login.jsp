<%@page import="DAO.Dao"%>
<%
    String Email = request.getParameter("Email");
    String Password = request.getParameter("Password");
    Dao d = new Dao();
    int Userid = d.isCorrectLogin(Email, Password);
    if (Userid != 0) {
        session.setAttribute("Login", Userid);
        out.print("True");
    } else {
        out.print("False");
    }

%>