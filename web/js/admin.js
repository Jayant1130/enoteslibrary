function ShowEnotesByUser(UserID) {
    var Model = document.getElementById("EnotesByUser");
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/ShowEnotesByUser.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "UserID=" + UserID;
    http.send(params);
    setProbar(0);
    http.onload = function () {
        var r = (http.responseText).toString().trim();
        Model.innerHTML = r
        Model.style.marginLeft = "0";
        Model.style.width = "100%";
        setProbar(1);
    }
}
