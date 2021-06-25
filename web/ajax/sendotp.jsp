<%@page import="javax.mail.MessagingException"%>
<%@page import="OTP.Otp"%>
<%@page import="Mail.SendMail"%>
<%
 String Name = request.getParameter("Name");
 String Email = request.getParameter("Email");
 //String Type = request.getParameter("Type");
 String otp = "";
         if(session.getAttribute("otp") == null){
  otp = new Otp().generateOTP();
    session.setAttribute("otp", otp);
         }else{
         otp = (String)session.getAttribute("otp");
         }
 
         String q = "<table width = 100% bgcolor= 'white' style='color:blue;'>"
                + "<tr><td><h2><center> <img width='100px' src='https://drive.google.com/uc?id=16H-MkwWvMvVBQvA89MYzLQaUjfNOgufM'></center> <h2><td><tr>"
                + "<tr><td><h2><center > ENotes Library</center> <h2><td><tr>"
                + "<tr><td><center> Hey, "+Name.toUpperCase()+"<br> Welcome in ENotes Library </center> <td><tr>"
                + "<tr><td><h4><center> Your OTP is "+otp+"</center> <h4><td><tr></div>";
         try{
 if(new SendMail().sendmail(Email, q)){
                 out.print("True");
 }
         }catch(MessagingException m){
                 out.print("False");
                 }

%>