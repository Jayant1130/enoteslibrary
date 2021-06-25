<%@page import="java.io.File"%>
<%@page import="DAO.Dao"%>
<%@page import="Model.User"%>
<%
    User u = new User();
    Dao d = new Dao();
    u.setUserID(d.getNextUserID());
    u.setName(request.getParameter("Name"));
    u.setEmail(request.getParameter("Email"));
    u.setMobile(request.getParameter("Mobile"));
    u.setPassword(request.getParameter("Password"));
    String Type = request.getParameter("Type");

    if (Type.equals("Instition")) {
        u.setType("Requested");
    }
    if (Type.equals("Student")) {
        u.setType("Student");
    }
    if (d.addUser(u)) {
        if (Type.equals("Student")) {
            session.setAttribute("Login", u.getUserID());
%>
<script>
    alert("Your Account Successfully Created");
    window.location.href = "./index.jsp"
</script>   
<%
    }
        if (Type.equals("Instition")) {
%>
<script>
    alert("You requested for an Institution Type account. Send your request to the admin panel for verification. We will reply on email as soon as possible or you check it by login.");
    window.location.href = "./index.jsp"
</script>   
<%
    }
} else {
%>
<script>
    alert("Not Valid User");
    window.location.href = "./index.jsp"
</script>   
<%
    }


%>