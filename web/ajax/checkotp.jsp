<%
 String otp = request.getParameter("Otp");
 String OrignalOTP = (String)session.getAttribute("otp");
 if(otp.equals(OrignalOTP)){
                  out.print("True");
 }else{
                  out.print("False");
 }

%>