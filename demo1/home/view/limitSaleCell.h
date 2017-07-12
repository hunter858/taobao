//
//  limitSaleCell.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "urlTool.h"
#import "homeTaobaoModel.h"
@interface limitSaleCell : UITableViewCell


- (void)setData:(NSArray *)array;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调
@end
