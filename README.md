TiWebViewExtension
==================

This is a simple extension to Appcelerator Titanium that allows you to set cookies &amp; user agents for TiWebViews on iOS. This project was totally inspired by [TiWebViewUserAgent](https://github.com/harukazepc/TiWebViewUserAgent).




Installation
------------


1. Add the following to the `<modules>` tag in your `tiapp.xml`.

```xml
<modules>
    <module version="0.1">com.ptrikutam.tiwebviewextension</module>
</modules>
```
2. Copy the file titled `com.ptrikutam.tiwebviewextension-iphone-0.1.zip` into your Titanium project directory. Titanium will automatically unzip this and place the appropriate files in the `modules/` directory.


Usage
-----


Make sure to require the module like so:

```javascript
var TiWebViewExtension = require('com.ptrikutam.tiwebviewextension');
```

Set your cookie and user agent like so: 

```javascript
TiWebViewExtension.setWebViewCookie({
	cookieName:"cookie_test",
	cookieValue:"true",
	cookieDomain: ".pavantrikutam.com",
	cookiePath: "/"
});

TiWebViewExtension.setWebViewUserAgent('Custom User Agent');
```


The whole thing:

```javascript
var webview = Titanium.UI.createWebView({ 
	url:'http://www.pavantrikutam.com'
});



TiWebViewExtension.setWebViewCookie({
	cookieName:"cookie_test",
	cookieValue:"true",
	cookieDomain: ".pavantrikutam.com",
	cookiePath: "/"
});

TiWebViewExtension.setWebViewUserAgent('Custom User Agent');
```


You can verify the settings worked by checking the cookies & user agent on load. 


```javascript
webview.addEventListener('load',function(e) {
    var cookies = webview.evalJS("document.cookie").split(";"); 
    Ti.API.info( "# of cookies -> " + cookies.length  );
    for (i = 0; i <= cookies.length - 1; i++) {
            Ti.API.info( "cookie -> " + cookies[i] );
    }

    var userAgent = webview.evalJS("navigator.userAgent");
    Ti.API.info("User Agent: " + userAgent);
});
```



Options
-------
You can set cookies with the following options:

* cookieName : Sets the name of cookie.
* cookieValue : Sets the cookie's value.
* cookieDomain : Sets cookie Domain.
* cookiePath : Sets path of cookie.
* cookieVersion : Sets the cookie version.
* cookieExpires : Sets expire date of cookie. Leaving it blank will default to a cookie expiring after session is complete.

TODO
----
* Create validation to check values passed for cookie / user agent
	* Return better error messaging
* Create Android version
* Add default values to domain, path, etc.