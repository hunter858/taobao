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
@property (nonatomic,strong)NSIndexPath *index;

-(void)setData:(NSArray *)array; //给整个cell赋值的方法

-(void)setleftData:(id)data;  //更新左侧产品的方法
-(void)setRightData:(id)data; //更新右侧产品的方法


@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

//点击左侧 喜欢不喜欢按钮block
@property (nonatomic,copy) void (^clickLeftLikeButton)(NSIndexPath *index);
@property (nonatomic,copy) void (^clickLeftDontLikeButton)(NSIndexPath *index);
//产品的找相似 和 不喜欢 按钮的block 回调^(NSIndexPath *index){

//点击右侧 喜欢不喜欢按钮block
@property (nonatomic,copy) void (^clickRightLikeButton)(NSIndexPath *index);
@property (nonatomic,copy) void (^clickRightDontLikeButton)(NSIndexPath *index);


@end
