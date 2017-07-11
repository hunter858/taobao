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

@interface bannerCell : UITableViewCell
@property (strong, nonatomic) IBOutlet SDCycleScrollView *cycleScrollerView;

-(void)setData:(NSArray *)array Blcok:(void(^)())block;

@end
