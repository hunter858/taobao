//
//  hotSaleView.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
/*
 设置item 的类型，显示不同的图标和标题，采用枚举类型，此处比较low 用的拼音
 */
typedef enum {
    guangguang = 1,
    haohuo,
    haitao,
    bimai,
    quanqiushishang
    
    
}saleType;

@interface hotSaleView : UIView

-(void)setData:(id)data;

@end
