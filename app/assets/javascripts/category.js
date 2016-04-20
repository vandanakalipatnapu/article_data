$(document).ready(function(){
	$("#categoryid").blur(function(){
	if ($("#categoryid").val()=="")
		document.getElementById("category").innerHTML="you must enter a name"	  
  	else if ($("#categoryid").val().match( /[0-9]|\(|\)|\&|\!|\#/)) 
    	document.getElementById("category").innerHTML="Enter letters only"
  	else 
    	document.getElementById("category").innerHTML="";
	});

	$("#buttonid").click(function(){
		if($("#categoryid").val()=="" || $("#categoryid").val().match( /[0-9]|\(|\)|\&|\!|\#/)){
			document.getElementById("category").innerHTML="Enter valid name"
			return false;
		}

		else{
			document.getElementById("button").innerHTML="";
			return true;
		}

		});
});