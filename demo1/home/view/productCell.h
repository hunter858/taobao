//
//  productCell.h
//  demo1
//
//  Created by pengchao on 2017/7/13.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "productView.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface productCell : UITableViewCell

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *viewArray;
@property (nonatomic,copy  )NSIndexPath *index;

-(void)setData:(NSArray *)array;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

@property (nonatomic,copy) void (^clickLikeButton)(NSIndexPath *index);
@property (nonatomic,copy) void (^clickdontLikeButton)(NSIndexPath *index);
//产品的找相似 和 不喜欢 按钮的block 回调^(NSIndexPath *index){


@end
