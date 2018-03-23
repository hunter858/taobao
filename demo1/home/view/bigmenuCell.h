//
//  bigmenuCell.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smallIconView.h"
#import "homeTaobaoModel.h"
#import "urlTool.h"
@interface bigmenuCell : UITableViewCell

-(void)setdata:(NSArray *)array Block:(void (^)())block;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

@end
