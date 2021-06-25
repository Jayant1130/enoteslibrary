<%
//session.setAttribute("Login", "10001");
session.invalidate();
response.sendRedirect("./index.jsp");
%>