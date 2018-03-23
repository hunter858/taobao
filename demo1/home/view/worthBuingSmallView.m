//
//  worthBuingSmallView.m
//  demo1
//
//  Created by pengchao on 2017/7/5.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "worthBuingSmallView.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface worthBuingSmallView ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;

@end


@implementation worthBuingSmallView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"worthBuingSmallView" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[worthBuingSmallView class]])
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
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        
        self.titleLabel.text =  [data objectForKey:@"title"];
        self.contentLabel.text =  [data objectForKey:@"subtitle"];
        NSString *leftUrl = [data objectForKey:@"leftImageUrl"];
        [data objectForKey:@"type"];
        
        [self.productImageView sd_setImageWithURL:[NSURL URLWithString:leftUrl]
                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];                
        
    }
    
    
}

@end
