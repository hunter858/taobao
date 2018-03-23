//
//  smallIconView.m
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "smallIconView.h"

@interface smallIconView ()


@end

@implementation smallIconView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"smallIconView" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[smallIconView class]])
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



-(void)setData:(id)object{
    
        itemsModel *model = [[itemsModel alloc]initWithDictionary:object error:nil]  ;
        imageUrl *urlModel = [model.imageUrl firstObject];
        NSString *url =[urlTool getUrlwithUrl:urlModel.imgUrl];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];    
        titleModel *title = [model.title firstObject];
        [self.titleLabel setText:title.valueDesc];
    
}

-(void)awakeFromNib{
    
        self.imageView.layer.masksToBounds =YES;
        self.imageView.layer.cornerRadius= self.imageView.bounds.size.height/2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
