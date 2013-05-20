// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

var webview = Titanium.UI.createWebView({
		url:'http://www.pavantrikutam.com'
	});

// TODO: write your module tests here
var TiWebViewExtension = require('com.ptrikutam.tiwebviewextension');
Ti.API.info("module is => " + TiWebViewExtension);


TiWebViewExtension.setWebViewCookie({
	cookieName:"cookie_test",
	cookieValue:"true",
	cookieDomain: ".pavantrikutam.com",
	cookiePath: "/"
});

TiWebViewExtension.setWebViewUserAgent('Custom User Agent');


//Check whether the cookies were properly set.
//Assuming the module & cookies were set up properly, 
//you should see one of these cookies as "cookie_test=true"
//This also checks for the User Agent to be properly Set.
webview.addEventListener('load',function(e) {
    var cookies = webview.evalJS("document.cookie").split(";"); 
    Ti.API.info( "# of cookies -> " + cookies.length  );
    for (i = 0; i <= cookies.length - 1; i++) {
            Ti.API.info( "cookie -> " + cookies[i] );
    }

    var userAgent = webview.evalJS("navigator.userAgent");
    Ti.API.info("User Agent: " + userAgent);
});


//Add the webview & load the window.
win.add(webview);
win.open();





