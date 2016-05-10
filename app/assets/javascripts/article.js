$(document).ready(function(){
	$("#titleid").blur(function(){
		if ($("#titleid").val()=="")
		  	document.getElementById("title").innerHTML="you must enter a name"
		else if ($("#titleid").val().match( /[0-9]|\(|\)|\&|\!|\#/)) 
    		document.getElementById("title").innerHTML="Enter letters only"
  		else 
  			document.getElementById("title").innerHTML=""
    		
	});

	$("#categoryid").blur(function(){
		if ($("#categoryid").val()=="")
		  	document.getElementById("category").innerHTML="you must select a category"
  		else 
  			document.getElementById("title").innerHTML=""
    		
	});

	$("#textid").blur(function(){
		if ($("#textid").val()=="")
		  	document.getElementById("text").innerHTML="you must enter a name"
		else if ($("#textid").val().match( /[0-9]|\(|\)|\&|\!|\#/)) 
    		document.getElementById("text").innerHTML="Enter letters only"
  		else 
  			document.getElementById("text").innerHTML=""
    		
	});

	$("#imageid").blur(function(){
		if ($("#image").val()=="")
		  	document.getElementById("image").innerHTML="you must select an image"
  		else 
  			document.getElementById("image").innerHTML=""
    		
	});



	$("#clickid").click(function(){
		if($("#textid").val() == "" || $("#textid").val().match( /[0-9]|\(|\)|\&|\!|\#/)){
			document.getElementById("click").innerHTML="Enter valid description"
			return false;
		}

		else if($("#categoryid").val()==""){
			document.getElementById("click").innerHTML="Select Category"
			return false;
		}

		else if($("#titleid").val() == "" || $("#titleid").val().match( /[0-9]|\(|\)|\&|\!|\#/)){
			document.getElementById("click").innerHTML="Enter valid title name"
			return false;
		}

		else if($("#imageid").val() == ""){
			document.getElementById("click").innerHTML="select image"
			return false;
		}

		else
			document.getElementById("click").innerHTML=""
			return true;

	});
	
});


