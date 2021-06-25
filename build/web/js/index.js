var OTPStatus = 0;
var CheckOTPStatus = 0;
var LoginStatus = 0;
function registration() {
    if (OTPStatus == 0) {
        sendotp();
        return false;
    } else {
        checkotp();
        if(CheckOTPStatus == 1){
        return true;
        }else{
            return false;
        }
        
    }

}
function login() {
//    CheckUser();
    if (LoginStatus == 0) {
            alert("Invalid User !" );
        return false;
    } else {
            alert("Login Suceesfully !");
            window.location.href = "./index.jsp";
    }

}

function CheckUser() {
    
    var Email = document.forms["Login"]["Email"].value;
    var Password = document.forms["Login"]["Password"].value;
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/login.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "Password=" + Password + "&Email=" + Email ;
    http.send(params);
    setProbar(0);
    http.onload = function () {
//        alert("Load")
        var r = (http.responseText).toString().trim();
        if (r == "True") {
            LoginStatus = 1;
        } else {
            LoginStatus = 0;
        }
        setProbar(1);
        return false;
    }
}

function sendotp() {
    var Name = document.forms["Registration"]["Name"].value;
    var Email = document.forms["Registration"]["Email"].value;
    var Type = document.forms["Registration"]["Type"].value;
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/sendotp.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "Name=" + Name + "&Email=" + Email + "&Type=" + Type;
    http.send(params);
    setProbar(0);
    http.onload = function () {
        var r = (http.responseText).toString().trim();
        if (r == "True") {
            alert("We sended email on " + Email + " for verification. Please Enter OTP  from Recevied email");
            OTPStatus = 1;
            document.getElementById("OTPdiv").style.display = "block";
            document.getElementById("OTPField").required = true;
        } else {
            alert("Unble to Send Email on  " + Email);
        }
        setProbar(1);
    }
}
function checkotp() {
    var Otp = document.forms["Registration"]["Otp"].value;
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/checkotp.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "Otp=" + Otp;
    http.send(params);
    setProbar(0);
    http.onload = function () {
        var r = (http.responseText).toString().trim();
        if (r == "True") {
            CheckOTPStatus = 1;
        } else {
            alert("OTP is wrong ! Please Try Again ......");
            CheckOTPStatus = 0;
        }
        setProbar(1);
    }
}

