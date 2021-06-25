<%@page import="Model.Enotes"%>
<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    Enotes enotes = d.getEnotesByEnotesID(Integer.parseInt(request.getParameter("EnotesID")));
    if(enotes != null){
        
%>  
<div class="model right">
            <form action="./UpdateEnotes.jsp" method="post">
                <Input type="hidden" value="<%=enotes.getEnotesid()%>" name="EnotesID">
                <div class="right-Condiv-Heading">E-Notes</div>
                <div class="profile-logo">
                    <img src="<%=enotes.getRLogo()%>">
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Name</div>
                    <div class="right-Condiv-fieldInput"><Input type="text" required=""  name="Name" value="<%=enotes.getName()%>"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Description</div>
                    <div class="right-Condiv-fieldInput" style="height:71px"><textarea required  name="Description" rows="4"  maxlength="500"><%=enotes.getDescription()%></textarea></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldInput">
                        <Input type="submit"  value="Update E-Notes"></div>
                </div>
            </form>
        </div>
<%
    }else{
%>
<div class="model right">
    Not Found ! Please Refresh Page.
</div>    
<%
    }
%>