<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
    console.log(response.authResponse.accessToken);
  } else {
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
	FB.login(function(response) {
		  // handle the response
		  console.log("checkLoginState()");
		  statusChangeCallback(response);
		  
		}, {scope: 'public_profile,email', return_scopes: true });
	
//   FB.getLoginStatus(function(response) {
	
    
//   });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '322184924864081', //test
//   appId      : '322180811531159', //real
  cookie     : true,  // enable cookies to allow the server to access 
                      // the session
  xfbml      : true,  // parse social plugins on this page
  version    : 'v2.8' // use graph api version 2.8
});

// Now that we've initialized the JavaScript SDK, we call 
// FB.getLoginStatus().  This function gets the state of the
// person visiting this page and can return one of three states to
// the callback you provide.  They can be:
//
// 1. Logged into your app ('connected')
// 2. Logged into Facebook, but not your app ('not_authorized')
// 3. Not logged into Facebook and can't tell if they are logged into
//    your app or not.
//
// These three cases are handled in the callback function.

// FB.getLoginStatus(function(response) {
// 	  console.log("FB.getLoginStatus()");


// });

};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    console.log('Successful login for: ' + response.email);
    console.log(JSON.stringify(response));
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
    
  });
  FB.api('/me', {fields: 'email,id,cover,name, first_name, last_name, age_range, link, gender, locale, picture, timezone, updated_time, verified'}, function(response){
	  console.log('permissions,Successful login for: ' + response.email);
	  console.log(JSON.stringify(response));
	  
	// Ajax 통신
		$.ajax( {
		    url : "${pageContext.request.contextPath }/fbget",
		    type: "get",
		    dataType: "json",
		    data: "email="+response.email,
		//  contentType: "application/json",
		    success: function( response ){
		    	console.log	( response );
		       if( response.result == "failed") {
		    	   console.log( response );
		       }
		    	//통신 성공 (response.result == "success" )
		       return true;
		    },
		    error: function( XHR, status, error ){
// 		       console.error( status + " : " + error );
		    }

		   });

  });
  
  
}

function logout(){
	FB.logout(function(response) {
		   // Person is now logged out
		console.log("FB.getLoginStatus()");
		console.log(response);
		});

}
</script>

</head>
<body>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
<a href="" onclick="logout()">
logout</a>

<div id="status">


</div>
</body>
</html>