//
//  AppDelegate.m
//  Weego
//
//  Created by Kevin on 16/3/4.
//  Copyright © 2016年 Weego. All rights reserved.
//

#import "AppDelegate.h"
#import "WGCurrentCityViewController.h"
#import "WGLeftDrawerViewController.h"
#import "WGNavigationViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

@interface AppDelegate ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *leftVC = [WGLeftDrawerViewController new];
    UIViewController *centerVC = [WGCurrentCityViewController new];
    
    WGNavigationViewController *navigationController = [[WGNavigationViewController alloc] initWithRootViewController:centerVC];
    [navigationController setRestorationIdentifier:@"WGCurrentCityViewControllerRestorationKey"];
    
    UINavigationController *leftNavigationController = [[WGNavigationViewController alloc] initWithRootViewController:leftVC];
    [leftNavigationController setRestorationIdentifier:@"WGLeftDrawerViewControllerRestorationKey"];
    
    
    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:navigationController
                             leftDrawerViewController:leftNavigationController
                             rightDrawerViewController:nil];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:5.f];
         block(drawerController, drawerSide, percentVisible);
     }];
    [self.drawerController setShowsShadow:YES];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window.rootViewController = self.drawerController;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSString * key = [identifierComponents lastObject];
    if([key isEqualToString:@"MMDrawer"]){
        return self.window.rootViewController;
    }
    else if ([key isEqualToString:@"WGCurrentCityViewControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    }
    else if ([key isEqualToString:@"WGLeftDrawerViewControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    }
    else if ([key isEqualToString:@"WGLeftDrawerViewController"]){
        UIViewController * leftVC = ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
        if([leftVC isKindOfClass:[UINavigationController class]]){
            return [(UINavigationController*)leftVC topViewController];
        }
        else {
            return leftVC;
        }
        
    }
    return nil;
}

@end
