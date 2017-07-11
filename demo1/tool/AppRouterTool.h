//
//  AppRouterTool.h
//  demo1
//
//  Created by pengchao on 2017/7/11.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "webViewController.h"
#import "urlTool.h"

@interface AppRouterTool : NSObject

+(void)pushWithUrl:(NSString *)url;

@end
