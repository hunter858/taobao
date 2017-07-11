//
//  hotSaleView.m
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "hotSaleView.h"

@interface hotSaleView ()

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLbale;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) IBOutlet UIImageView *rightImageview;
@property (strong, nonatomic) IBOutlet UIImageView *leftImageview;




@end

@implementation hotSaleView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"hotSaleView" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[hotSaleView class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)setData:(id)data{
    
    
    //其实这里应该用jsonModel 对象的，但是作者比较懒，就用 NSDictionary 来写好了😊

    
    if([data isKindOfClass:[NSDictionary class]]){
        
     self.titleLbale.text =  [data objectForKey:@"title"];
     self.contentLabel.text =  [data objectForKey:@"subtitle"];
     NSString *leftUrl = [data objectForKey:@"leftImageUrl"];
     NSString *rightUrl = [data objectForKey:@"rightImageUrl"];
        [data objectForKey:@"type"];
        
     [self.leftImageview sd_setImageWithURL:[NSURL URLWithString:leftUrl]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
     [self.rightImageview sd_setImageWithURL:[NSURL URLWithString:rightUrl]
                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
    // 此处利用枚举 列出 menu 的类型
    int type = [[data objectForKey:@"type"] intValue];

    switch (type) {
        case guangguang:
            self.iconImageView.image =[UIImage imageNamed:@"guangguang"];
            self.titleLbale.textColor = RGBA(251, 35, 81, 1);
                break;
        case haohuo:
            self.iconImageView.image =[UIImage imageNamed:@"haohuo"];
            self.titleLbale.textColor = RGBA(0, 167, 255, 1);
            break;
            
        case haitao:
            self.iconImageView.image =[UIImage imageNamed:@"haitao"];
            self.titleLbale.textColor = RGBA(252, 24, 40, 1);
            break;
            
        case bimai:
            self.iconImageView.image =[UIImage imageNamed:@"bimai"];
            self.titleLbale.textColor = RGBA(251, 17, 69, 1);
            break;
            
        case quanqiushishang:
            self.iconImageView.image =[UIImage imageNamed:@"bimai"];
            self.titleLbale.textColor = RGBA(251, 17, 69, 1);

            break;
            
            default:
                break;
        }
        
        
    }
    
    
}


@end
