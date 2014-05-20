//
//  GDRoute.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 Go Daddy Operating Company, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Protocol that describes how to display a view controller when a route is selected
 */
@protocol GDRoutingDelegate <NSObject>

/**
 *  Pushes a view controller
 *
 *  @param viewController - View controller to be pushed
 *  @param animated       - Should the transition be animated
 *  @param parameters     - Parameters associated with the transition or to set onto the pushed view controller
 */
-(void) pushRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters;

@optional

/**
 *  Presents a view controller
 *
 *  @param viewController - View controller to be presented
 *  @param animated       - Should the transition be animated
 *  @param parameters     - Parameters associated with the transition or to set onto the presented view controller
 */
-(void) presentRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters;

/**
 *  Pops the current view controller
 *
 *  @param animated   - Should the transition be animated
 *  @param parameters - Parameters associated with the transition
 */
-(void) popRoutedViewController:(BOOL)animated parameters:(NSDictionary *)parameters;

/**
 *  Pops to the root view controller
 *
 *  @param animated   - Should the transition be animated
 *  @param parameters Parameters associated with the transition
 */
-(void) popRoutedViewControllerToRootViewController:(BOOL)animated parameters:(NSDictionary *)parameters;

@end


/**
 *  Block to perform when the route is selected
 *
 *  @param id<GDRoutingDelegate> - Object to perform the GDRoutingDelegate selector
 *  @param                       - Route url
 *  @param                       - Parameter dictionary
 *
 *  @return Whether or not the routing action was performed.
 */
typedef BOOL (^GDRoutingBlock)(id<GDRoutingDelegate>, NSString *, NSDictionary *);

/**
 *  GDRoute stores information about the urlString and the routing block to be called when the route is selected
 */
@interface GDRoute : NSObject

/**
 *  Url string path to the view controller you want to load
 */
@property (nonatomic, strong) NSString *urlString;

/**
 *  Block to perform when the route is selected
 */
@property (nonatomic, strong) GDRoutingBlock routingBlock;

/**
 *  Class method that returns a route configured with the passed in url string and routing block
 *
 *  @param inURLString    - Url string path to the view controller you want to load
 *  @param inRoutingBlock -
 *
 *  @return Block to perform when the route is selected
 */
+(instancetype)routeWithURLString:(NSString *)inURLString andAction:(GDRoutingBlock)inRoutingBlock;

/**
 *  Returns a URL object created from the base app url string and the url string from the GDRoute
 *
 *  @param inBaseAppURLString - Base app url string
 *
 *  @return URL object created from the base app url string and the url string from the GDRoute
 */
- (NSURL *)urlWithBaseAppURLString:(NSString *)inBaseAppURLString;

@end
