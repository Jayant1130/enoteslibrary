<%@page import="Model.Enotes"%>
<%@page import="DAO.Dao"%>
<%
    Dao d = new Dao();
    Enotes enotes = d.getEnotesByEnotesID(Integer.parseInt(request.getParameter("EnotesID")));
    if(enotes != null){
        
%>  
<div class="model right">
            <form action="./DeleteEnotes.jsp" method="post">
                <Input type="hidden" value="<%=enotes.getEnotesid()%>" name="EnotesID">
                <div class="right-Condiv-Heading">E-Notes</div>
                <div class="profile-logo">
                    <img src="<%=enotes.getRLogo()%>">
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Name</div>
                    <div class="right-Condiv-fieldInput"><Input type="text" required="" readonly value="<%=enotes.getName()%>"></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldName">E-Notes Description</div>
                    <div class="right-Condiv-fieldInput" style="height:71px"><textarea  rows="4" readonly ><%=enotes.getDescription()%></textarea></div>
                </div>
                <div class="right-Condiv-field">
                    <div class="right-Condiv-fieldInput">
                        <Input type="submit"  value="Delete E-Notes"></div>
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