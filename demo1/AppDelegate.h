//
//  AppDelegate.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)UINavigationController *navController;

+(AppDelegate *)getAppDelegate;

@end

