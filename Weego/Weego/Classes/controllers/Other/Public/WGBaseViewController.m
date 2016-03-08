//
//  WGBaseViewController.m
//  Weego
//
//  Created by Kevin on 16/3/5.
//  Copyright © 2016年 Weego. All rights reserved.
//

#import "WGBaseViewController.h"

@interface WGBaseViewController () 

@end

@implementation WGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupNavBar {
    self.fd_prefersNavigationBarHidden = YES;
    self.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = 100;
    self.NavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, Screen_W, Nav_Bar_H)];
    [self.view addSubview:self.NavigationBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count == 1) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    }else {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
        [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    }
}

@end
