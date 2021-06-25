var url = "http://localhost:8084/ENotesLibrary/"

function loaded(){
     document.getElementById("loader").style.display = "none";
}

var progbar = 1;
var pog;

var  width = 0;
function setProbar(num){
    progbar = Number(num);
    }
    function progress(){
		var p = document.getElementById("progressbarper");
		var pb = document.getElementById("progressdiv");
		if(width > 100){
		p.style.width = (200 - width) + "%";
		}else{
		p.style.width = width + "%";
		}
		width++;
		if(width == 200){
			width = 0
		}
		if(progbar == 1){
			pb.style.display = "none";
		}else{
			pb.style.display = "flex";
		}
		
	}
		


var  lineOne = 0;
var  linetwo = 40;
var  linethree = 20;
function StartSlider(){
		var line1 = document.getElementById("line1");
		var line2 = document.getElementById("line2");
		var line3 = document.getElementById("line3");
		if(lineOne > 100){
		line1.style.marginLeft = (200 - lineOne) + "%";
		}else{
		line1.style.marginLeft = lineOne + "%";
		}
		lineOne++;
		if(lineOne == 200){
			lineOne = 0
		}
		if(linetwo > 100){
		line2.style.width = (200 - linetwo) + "%";
		}else{
		line2.style.width = linetwo + "%";
		}
		linetwo++;
		if(linetwo == 200){
			linetwo = 0
		}
		if(linethree > 100){
		line3.style.marginLeft = (200 - linethree) + "%";
		}else{
		line3.style.marginLeft = linethree + "%";
		}
		linethree++;
		if(linethree == 200){
			linethree = 0
		}

	
	
}

function appearLinkModel(){
	var LinkModel = document.getElementById("LinkModel");
	LinkModel.style.marginLeft = 0;
	LinkModel.style.width = "100%";
}
function closeLinkModel(event){
	var LinkModel = document.getElementById("LinkModel");
	if (event.target == LinkModel) {
	LinkModel.style.marginLeft = "-30%";
	LinkModel.style.width = "0";
	}
}

function openlogin(){
		var loginModel = document.getElementById("loginModel");
	loginModel.style.marginLeft = "0";
	loginModel.style.width = "100%";
	
}
function openModel(id){
		var Model = document.getElementById(id);
	Model.style.marginLeft = "0";
	Model.style.width = "100%";
	
}
function closeModel(event,id){
	var Model = document.getElementById(id);
	if (event.target == Model) {
	Model.style.marginLeft = "-100vw";
	Model.style.width = "0";
	}	
}
function search(){
	var serachbar = document.getElementById("serachbar").value;
	var searchbox = document.getElementById("searchModel");
	if(serachbar == ""){
	searchbox.style.marginLeft = "-100vw";
	searchbox.style.width = "0";
	}else{
			searchbox.style.marginLeft = "0";
	searchbox.style.width = "100%";

		
	}
}
function closeLoginModel(event){
	var loginModel = document.getElementById("loginModel");
	if (event.target == loginModel) {
	loginModel.style.marginLeft = "-100vw";
	loginModel.style.width = "0";
	}	
	
	
	
}

	var mybutton = document.getElementById("myBtn");
	window.onscroll = function() {scrollFunction()};
	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		mybutton.style.display = "block";
	  } else {
		mybutton.style.display = "none";
	  }
	}
	function topFunction() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}


function SerachTab(SerachKey) {
    var Model = document.getElementById("searchModel");
//    alert(Otp)
    var http = new XMLHttpRequest();
    http.open("POST", url + "/ajax/SerachTab.jsp?", true);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var params = "SerachKey=" + SerachKey;
    http.send(params);
    setProbar(0);
    http.onload = function () {
        
        if(r==""){
                Model.style.marginLeft = "-100wh";
        Model.style.width = "100%";
            
        }else{
        var r = (http.responseText).toString().trim();
        Model.innerHTML = r
        Model.style.marginLeft = "0";
        Model.style.width = "100%";
        setProbar(1);
    }
    }
}