<%@page import="Model.Enotes"%>
<%@page import="DAO.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Dao d = new Dao();
    Enotes enotes = d.getEnotesByEnotesID(Integer.parseInt(request.getParameter("q")));
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>E-Notes Library</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel = "icon" href = "img/icon.ico"         type = "image/x-icon">
    </head>
    <body style="margin :0; padding: 0;height: 100vh;">
        <embed src="<%=enotes.getRDocument()%>" style="width: 100%;height:100%;"/>
    </body>
</html>
