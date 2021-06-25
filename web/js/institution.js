function ViewEnotesModel(Enotesid) {
    var Model = document.getElementById("EnotesModel");
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/ShowViewModel.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "EnotesID=" + Enotesid;
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

function DeleteEnotesModel(Enotesid) {
    var Model = document.getElementById("EnotesModel");
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/ShowDeleteModel.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "EnotesID=" + Enotesid;
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

function UpdateEnotesModel(Enotesid) {
    var Model = document.getElementById("EnotesModel");
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/ShowUpdateModel.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "EnotesID=" + Enotesid;
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
