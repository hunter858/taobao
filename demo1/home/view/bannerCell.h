//
//  bannerCell.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "homeTaobaoModel.h"
#import "urlTool.h"

@interface bannerCell : UITableViewCell<SDCycleScrollViewDelegate>
@property (strong, nonatomic) IBOutlet SDCycleScrollView *cycleScrollerView;

-(void)setData:(NSArray *)array Blcok:(void(^)())block;


@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

@end
