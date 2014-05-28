GDRouting
=========

GDRouting is a framework for using private CocoaPod repositories to modularizing a large application into sub-applications. The open source repo JLRoutes is used create x-callback-urls to glue all the sub-apps together accessible though a menu system or with string keys exposed in each sub-app.

This repo buids upon concepts taken from the blog post <a href="http://dev.hubspot.com/blog/architecting-a-large-ios-app-with-cocoapods">Using CocoaPods to Modularize a Big iOS App</a> by Anthony Roldan of HubSpot.

<h2>GDMenuItem</h2>

GDMenuItem hold properties that determine what shows up in the menu table view, these being title and iconImageName. It also has properies of displayOrder so that you can order menu items in a sub-app and sectionTitle if you want a section header to appear before the menu item.

<pre>
GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:MenuItemTitle andDisplayOrder:0];
menuItem.sectionTitle = SectionTitle;
</pre>

<h2>GDRoute</h2>
GDRoute stores information about the urlString and the routing block to be called when the route is selected
 
 <pre>
GDRoute *route = [GDRoute routeWithURLString:[NSString stringWithFormat:@"/%@", ViewControllerIdentifier] andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
	[routingDelegate pushRoutedViewController:[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName] animated:YES parameters:nil];
	    return YES;
	}];
 </pre>
 
<h2>GDBaseApp</h2>
All sub-applications should have at least one class that implements this protocol. It is used to get menu items and routes used in the sub-app.

Here is what the implementation of the ManateeApp looks like:
<pre>
@implementation ManateeApp

static NSString *const StoryboardName = @"Main";
static NSString *const ViewControllerIdentifier = @"ManateeViewController";
static NSString *const MenuItemTitle = @"MANATEES";

+ (UINavigationController *)baseNavigationController
{
	return [[UINavigationController alloc] initWithRootViewController:[UIStoryboard instantiateViewControllerWithIdentifier:ViewControllerIdentifier andStoryboardName:StoryboardName]];
}

+ (NSArray *)menuItems
{
	GDMenuItem *menuItem = [[GDMenuItem alloc] initWithTitle:MenuItemTitle andIconImageName:nil];
	return @[menuItem];
}

+ (NSDictionary *)routesToRegister
{
	GDRoute *route = [GDRoute routeWithURLString:[NSString stringWithFormat:@"/%@", ViewControllerIdentifier] andAction: ^BOOL (id <GDRoutingDelegate> routingDelegate, NSString *urlString, NSDictionary *parameters) {
	    [routingDelegate popRoutedViewControllerToRootViewController:YES parameters:nil];
	    return YES;
	}];

    NSDictionary *routeDictionary = @{ViewControllerIdentifier : route};
	return routeDictionary;
}
</pre>

<h2>GDUsableApp</h2>

A GDUsableApp is a representation of an sub-app that is configured for use in your main application. It has 2 properties, displayOrder which is used to determine what order menu items from the app show up in menu and appName which matches the name of the sub-app class that you want to import.

Usage:

<pre>
GDUsableApp *manateeApp = [[GDUsableApp alloc] init];
manateeApp.displayOrder = 0;
manateeApp.appName = @"ManateeApp";
</pre>

<h2>GDAppConfiguration</h2>

GDAppConfiguration is an archivable object used to store configuration information about the app. 

<pre>
    GDAppConfiguration *appConfiguration = [[GDAppConfiguration alloc] init];
    appConfiguration.usableAppArray = @[manateeApp];
    [appConfiguration archiveObject];
</pre>

<h2>GDAppManager</h2>
GDAppManager provides functionality to get all the available GDMenuItems and GDRoutes configured in an application using an array of GDUsableApps. It is also used to set up all your routes.

<pre>
    GDAppManager *appManager = [[GDAppManager alloc] initWithUsableAppArray:appConfiguration.usableAppArray];
    [appManager registerRoutesForAppsWithRoutingDelegate:self];
</pre>
