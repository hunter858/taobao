//
//  twoImageCell.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotSaleView.h"
#import "Masonry.h"
#import "homeTaobaoModel.h"
#import "urlTool.h"
#import "UIImageView+WebCache.h"

@interface twoImageCell : UITableViewCell

-(void)setData:(NSArray *)array;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

@end
