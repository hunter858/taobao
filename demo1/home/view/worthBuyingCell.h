//
//  worthBuyingCell.h
//  demo1
//
//  Created by pengchao on 2017/7/5.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "worthBuingSmallView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "twoimageview.h"
#import "oneImageView.h"
#import "productView.h"


typedef enum {
 firstStyle = 0,    //最左侧的view 0.4 右侧三个0.2比例
 sectionStyle = 1,  //四等分的view 比例0.25
 threeStyle = 2,    //二等分的view 各个view nei评分
 productStyle= 4,   //二等分的产品 样式 分类
 fourTitleStyle= 5, //标题用原生的
 twoTitleStyle = 6,  //2等分，标题用原生的
 product = 7
}cellProductStyel;


@interface worthBuyingCell : UITableViewCell

-(void)setData:(NSArray *)array;

-(void)setProductData:(NSArray *)array;

-(void)settype:(cellProductStyel)type;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);
//用户接受点击URL的block 回调

@end
