window.fbAsyncInit = function() {
FB.init({
  appId      : '322180811531159',
//  appId      : '322184924864081', //TEST
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

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
//  console.log('statusChangeCallback');
//  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
  } else {
	  
    // The person is not logged into your app or we are unable to tell.
//    document.getElementById('loginstatus').innerHTML = '';
	  $("#loginpic").attr("src","");
	  Logout();
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

function Logout() {
//	console.log("logout");
	$.post("/poorip/user/facebooklogout");
};
	
// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
   FB.api('/me', {fields: 'email,id,cover,name, first_name, last_name, age_range, link, gender, locale, picture, timezone, updated_time, verified, birthday'}, function(response) {
//    document.getElementById('loginstatus').innerHTML = response.name;
    	$.post("/poorip/user/facebooklogin",
	        {
    			email: response.email,
    			name: response.name,
    			gender: response.gender,
    			link: response.picture.data.url,
				locale: response.locale,
				id : response.id,
				birthday: response.birthday
	        },
	        function(data,status){
	        	$("#loginpic").attr("src",data);
//	        	console.log(data);
	        	if (data == "addinfo"){
	        		// 다이얼로그로 띄우기 후 페이지 이동
	        		$(location).attr('href', '/poorip/user/addinfo')
	        	}
	        		
	        	return;
	        });
  });
}