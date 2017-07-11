//
//  AppRouterTool.m
//  demo1
//
//  Created by pengchao on 2017/7/11.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "AppRouterTool.h"

@implementation AppRouterTool

+(void)pushWithUrl:(NSString *)url{
    
    url = [urlTool getUrlwithUrl:url];
    
    
    
    AppDelegate *app =  [AppDelegate getAppDelegate];
    webViewController *webControl = [[webViewController alloc]init];
    webControl.url = url;
    [app.navController pushViewController:webControl animated:YES];
    
}

@end
