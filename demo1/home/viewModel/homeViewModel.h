//
//  homeViewModel.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewDataModel.h"
#import "bannerCell.h"
#import "limitSaleCell.h"
#import "bigmenuCell.h"
#import "advertisementCell.h"
#import "twoImageCell.h"
#import "titleMoreCell.h"
#import "worthBuyingCell.h"
#import "AppRouterTool.h"
#import "productCell.h"

typedef enum {
    template,   //轮播模版
    
    
}celltype;

@interface homeViewModel : NSObject

@property (nonatomic,strong) TableViewDataModel *tableViewDataModel;

-(void)setData:(void (^)())callback;

@property (nonatomic,copy) void (^reloadTableview)(NSIndexPath *index);

//-(void)reloadTableview:(void(^)(NSIndexPath *index))callback;

@end
