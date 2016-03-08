//
//  WGCurrentCityViewController.m
//  Weego
//
//  Created by Kevin on 16/3/5.
//  Copyright © 2016年 Weego. All rights reserved.
//

#import "WGCurrentCityViewController.h"
#import "WGLoginViewController.h"


@interface WGCurrentCityViewController ()

@end

@implementation WGCurrentCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    NSLog(@"%zd",self.navigationController.viewControllers.count);
    
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, Screen_W, 100)];
    sc.backgroundColor = [UIColor cyanColor];
    sc.contentSize = CGSizeMake(Screen_W*2, 100);
    [self.view addSubview:sc];
}

- (void)clicked {
    WGCurrentCityViewController *vc = [WGCurrentCityViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
