//
//  AppNavigationController.m
//  demo1
//
//  Created by pengchao on 2017/7/12.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "AppNavigationController.h"

@implementation AppNavigationController`
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18], NSFontAttributeName, nil]];
    //    self.navigationBar.barTintColor = [UIColor whiteColor];//背景色
    //    self.navigationBar.barTintColor = navigationBarColor;//背景色
    [self.navigationBar setTintColor:[UIColor whiteColor]];//左右标题颜色
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self initviews];
}
-(void)initviews{
//    UINavigationItem *leftButton =[UINavigationItem alloc]init
    
}

@end
