//
//  WGLeftDrawerViewController.m
//  Weego
//
//  Created by Kevin on 16/3/5.
//  Copyright © 2016年 Weego. All rights reserved.
//

#import "WGLeftDrawerViewController.h"

@interface WGLeftDrawerViewController ()

@end

@implementation WGLeftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 10086;
    self.view.backgroundColor = [UIColor orangeColor];
    self.fd_prefersNavigationBarHidden = YES;
}

@end
