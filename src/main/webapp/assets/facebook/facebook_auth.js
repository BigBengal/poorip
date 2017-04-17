/**
 * 
 */


window.fbAsyncInit = function() {
FB.init({
//	appId      : '322184924864081', //test
	appId      : '322180811531159', //real
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

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};
//Load the SDK asynchronously
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/ko_KR/sdk.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


//This function is called when someone finishes with the Login
//Button.  See the onlogin handler attached to it in the sample
//code below.
function facebooklogin() {
	console.log("FB.login()")
//	FB.login(function(response) {
//		  // handle the response
//		  console.log("checkLoginState()");
//		  statusChangeCallback(response);
//		  
//		}, {scope: 'public_profile,email,user_birthday'});
	FB.getLoginStatus(function(response) {
		console.log(response);
		statusChangeCallback(response);
	}, true);
	
}

//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response.status);
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
	  document.getElementById('status').innerHTML =
	      'Thanks for logging in, ' + response.name + '!';
//    testAPI();
  } else {
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  }
}

function doLogin() {
    FB.login(function(response) {
        if (response.authResponse) {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function(response) {
                console.log('Good to see you, ' + response.name + '.');
            });
        } else {
            console.log('User cancelled login or did not fully authorize.');
        }
    }, {scope: 'email,user_friends'});
}

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', {fields: 'email,id,cover,name, first_name, last_name, age_range, link, gender, locale, picture, timezone, updated_time, verified, birthday'}, 
		  function(response){
		console.log('permissions,Successful login for: ' + response.birthday);
		console.log(JSON.stringify(response));
//		console.log('Successful login for: ' + response.picture);
//		console.log('Successful login for: ' + response.picture.data.url);
	    
		document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
		$.post("fbget",
		        {
					usrEmail: response.email,
					usrGender: response.gender,
					usrProfile: response.picture.data.url,
					usrLang: response.locale,
					usrBd: response.birthday
		        },
		        function(data,status){
		        	
//		        	$(location).delay(800).attr('href', '/poorip')
//	        		console.log(d	ata);
		        	return;
		        });
  });
  
}

function logout(){
	console.log("FB.logout()");
	FB.logout(function(response) {
		   // Person is now logged out
		console.log(response);
		
		
	});
	$.post("user/logout", function(data,status){
		console.log("logout");
	});
}