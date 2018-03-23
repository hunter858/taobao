//
//  urlTool.h
//  demo1
//
//  Created by pengchao on 2017/7/9.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface urlTool : NSObject

// 如果URl 里含有 // 则替换成 http 写成工具
+ (NSString *)getUrlwithUrl:(NSString *)url;

@end
