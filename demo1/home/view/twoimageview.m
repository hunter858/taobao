//
//  twoimageview.m
//  demo1
//
//  Created by pengchao on 2017/7/6.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "twoimageview.h"

@implementation twoimageview

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"twoimageview" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[twoimageview class]])
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
    
    if ([data isKindOfClass:[itemsModel class]]) {
        
        itemsModel *model = (itemsModel *) data;
        
        titleModel *title = [model.title firstObject];
        titleModel *content = [model.title lastObject];
        self.titleLabel.text = title.valueDesc;
        self.contentLabel.text = content.valueDesc;
        
        imageUrl *leftModel  = [model.imageUrl firstObject];
        imageUrl *rightModel  = [model.imageUrl lastObject];
        NSString *leftUrl = [urlTool getUrlwithUrl: leftModel.imgUrl];
        NSString *rightUrl = [urlTool getUrlwithUrl: leftModel.imgUrl];
        [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:leftUrl]
                                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:rightUrl]
                                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
    }
}

@end
