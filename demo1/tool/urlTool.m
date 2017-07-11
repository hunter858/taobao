//
//  urlTool.m
//  demo1
//
//  Created by pengchao on 2017/7/9.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "urlTool.h"

@implementation urlTool
+ (NSString *)getUrlwithUrl:(NSString *)url{
    if ([url containsString:@"//"]) {
        url = [url stringByReplacingOccurrencesOfString:@"//" withString:@"http://"];
    }
    return  url;
}
@end
