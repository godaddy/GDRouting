//
//  GDRoute.h
//  GDRouting-Example
//
//  Created by Jonah G. Neugass on 5/1/14.
//  Copyright (c) 2014 GoDaddy. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GDRoutingDelegate <NSObject>

-(void) pushRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters;

@optional

-(void) presentRoutedViewController:(UIViewController *)viewController animated:(BOOL)animated parameters:(NSDictionary *)parameters;

-(void) popRoutedViewController:(BOOL)animated parameters:(NSDictionary *)parameters;

-(void) popRoutedViewControllerToRootViewController:(BOOL)animated parameters:(NSDictionary *)parameters;

@end



typedef BOOL (^GDRoutingBlock)(id<GDRoutingDelegate>, NSString *, NSDictionary *);

@interface GDRoute : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) GDRoutingBlock routingBlock;

+(instancetype)routeWithURLString:(NSString *)inURLString andAction:(GDRoutingBlock)inRoutingBlock;

- (NSURL *)urlWithBaseAppURLString:(NSString *)inBaseAppURLString;

@end
