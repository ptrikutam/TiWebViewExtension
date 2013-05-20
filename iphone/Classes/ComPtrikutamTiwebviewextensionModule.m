/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComPtrikutamTiwebviewextensionModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComPtrikutamTiwebviewextensionModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"d8587103-513f-48a7-a5be-bcafc7ef3795";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.ptrikutam.tiwebviewextension";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)setWebViewUserAgent:(id)value
{
	ENSURE_SINGLE_ARG(value,NSString);
    NSDictionary *dictionnary = [[NSDictionary alloc] initWithObjectsAndKeys:value, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionnary];
    [dictionnary release];
}


-(void)setWebViewCookie:(id)args
{
    
	ENSURE_SINGLE_ARG(args,NSDictionary);
    
	NSString* cookieName = [TiUtils stringValue:@"cookieName" properties:args];
	NSString* cookieValue = [TiUtils stringValue:@"cookieValue" properties:args];
	NSString* cookieDomain = [TiUtils stringValue:@"cookieDomain" properties:args];
    NSString* cookiePath = [TiUtils stringValue:@"cookiePath" properties:args];
    NSString* cookieVersion = [TiUtils stringValue:@"cookieVersion" properties:args];
    NSString* cookieExpires = [TiUtils stringValue:@"cookieExpires" properties:args];
    
    if (cookieName == nil || cookieValue == nil || cookieDomain == nil || cookiePath == nil) {
        NSLog(@"Please set the cookie name, value, domain, and path.");
        return;
    }
    
    
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:cookieName forKey:NSHTTPCookieName];
    [cookieProperties setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookieProperties setObject:cookieDomain forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:cookiePath forKey:NSHTTPCookiePath];
    
    if (cookieVersion != nil) {
        NSLog(@"[INFO] Setting Cookie Version");
        [cookieProperties setObject:cookieVersion forKey:NSHTTPCookieVersion];
    }
    
    
    // set expiration to any NSDate of your choosing
    /// if you want the cookie to be destroyed when your app exits, don't set this
    if (cookieExpires != nil) {
        // Convert string to date object
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyyMMdd"];
        NSDate *cookieExpiresDate = [dateFormat dateFromString:cookieExpires];
        [cookieProperties setObject:cookieExpiresDate forKey:NSHTTPCookieExpires];
    }
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    
}


@end
