    <nav class="navbar">
        <div class="ham" onclick="appearLinkModel()">
            <i class="fas fa-bars" ></i>
        </div>
        <div class="modelback" id="LinkModel" onclick="closeLinkModel(event)">
            <div class="model">
                <a href="./index.jsp"><div class="link" ><linkicon><i class="fas fa-home"></i></linkicon>Home</div></a>
            </div>
        </div>
        <div class="logo">
            <img src="img/Logo.png">
        </div>
        <div class="searchbar" ><input type="text" id="serachbar" onkeyup="SerachTab(serachbar.value)"placeholder="Search by E-Notes Name, Institution, etc........"><i class="fas fa-search"></i></div>
        <div class="modelback " id="searchModel" style="margin-top:63px">
        </div>
        <div class="login" onclick="openlogin()">
            <i class="fas fa-user-circle"></i> 
            <div class="loginName" id="loginName">
                <%        if (UserID != 0) {
                %>
                <%=u.getName()%> 
                <%
                } else {
                %>
                Login/Registration
                <%
                    }%>
            </div>
        </div>
        <%
            if (UserID != 0) {
        %>
        <div class="modelback " id="loginModel" onclick="closeLoginModel(event)">
            <div class="model right">
                <div class="Profile">
                    <div class="backbut">
                    </div>
                    <div class="profile-logo">
                        <%if (u.getType().equals("Student")) {%>
                        <img src="img/UserLogo.png">
                        <%} else if (u.getType().equals("Requested")) {%>
                        <img src="img/InstitutionLogo.jpg">
                        <%} else if (u.getType().equals("Deactive")) {%>
                        <img src="img/InstitutionLogo.jpg">
                        <%} else if (u.getType().equals("Institution")) {%>
                        <img src="img/InstitutionLogo.jpg">
                        <%} else if (u.getType().equals("Admin")) {%>
                        <img src="img/UserLogo.png">
                        <%}%>
                    </div>
                    <div class="profile-name">
                        <%=u.getName().toUpperCase()%>
                    </div>
                    <div class="profile-Email">
                        <%=u.getEmail()%>
                    </div>
                    <div class="profile-Mobile">
                        <%=u.getMobile()%>
                    </div>
                    <a href="./index.jsp"  class="dashbutton">Home</a>
                    <br>
                        <%if (u.getType().equals("Student")) {%>
                        <%} else if (u.getType().equals("Requested")) {%>
                        <a href="./Message.jsp?msgid=1" class="dashbutton">Dashboard</a>
                        <%} else if (u.getType().equals("Deactive")) {%>
                        <a href="./Message.jsp?msgid=2" class="dashbutton">Dashboard</a>
                        <%} else if (u.getType().equals("Institution")) {%>
                        <a href="./InstitutionDashboard.jsp" class="dashbutton">Dashboard</a>
                        <%} else if (u.getType().equals("Admin")) {%>
                        <a href="./AdminDashboard.jsp" class="dashbutton">Dashboard</a>
                        <%}%>
                    <br>
                    <a href="./logout.jsp" style="background-color: red;" class="dashbutton">Logout</a>
                </div>

            </div>
        </div> 
        <%
        } else {
        %>
        <div class="modelback " id="loginModel" onclick="closeLoginModel(event)">
            <div class="model right">
                <div class="button1">
                    <div class="" onclick="loginDiv.style.display = 'block';RegistrationDiv.style.display = 'none';">Login</div>
                    <div class="" onclick="loginDiv.style.display = 'none';RegistrationDiv.style.display = 'block';">Registration</div>
                </div>
                <div class="right-Con">
                    <div class="right-Condiv"  id="loginDiv">
                        <form method="post" name = "Login" onsubmit="return login();">
                            <div class="right-Condiv-Heading">Login</div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Email</div>
                                <div class="right-Condiv-fieldInput"><Input required type="Email" onchange="CheckUser();" name="Email"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Password</div>
                                <div class="right-Condiv-fieldInput"><Input required type="password" onchange="CheckUser();" name = "Password"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldInput"><Input type="submit" value="Let Me In"></div>
                            </div>
                        </form>	
                    </div>
                    <div class="right-Condiv"  style="display:none" id="RegistrationDiv">
                        <form action="adduser.jsp" method="post" name ="Registration" onsubmit="return registration();">
                            <div class="right-Condiv-Heading">Registration</div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Name</div>
                                <div class="right-Condiv-fieldInput"><Input type="text" id="NameField" required name="Name"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Email</div>
                                <div class="right-Condiv-fieldInput"><Input type="email" id="EmailField" required  name ="Email"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Mobile No.</div>
                                <div class="right-Condiv-fieldInput"><Input type="tel" id="MobileField" pattern="[0-9]{10}" required name="Mobile"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Password</div>
                                <div class="right-Condiv-fieldInput"><Input type="password" id="PasswordField" required  name="Password" maxlength="10"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldName">Type of Account</div>
                                <div class="right-Condiv-fieldInput"><Input type="radio" name ="Type" id="TypeField1" required  value="Instition">Institution</input><Input type="radio" id="TypeField2"  required  name ="Type" value="Student">Student</input></div>
                            </div>
                            <div class="right-Condiv-field" id="OTPdiv" style="display: none;">
                                <div class="right-Condiv-fieldName">OTP</div>
                                <div class="right-Condiv-fieldInput"><Input type="text" id="OTPField" name ="Otp"></div>
                            </div>
                            <div class="right-Condiv-field">
                                <div class="right-Condiv-fieldInput"><Input type="Submit"  id="Create" value="Create Account"></div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
        <%
            }
        %>

    </nav>