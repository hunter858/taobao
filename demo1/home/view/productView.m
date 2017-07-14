//
//  productView.m
//  demo1
//
//  Created by pengchao on 2017/7/10.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "productView.h"

@implementation productView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"productView" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[productView class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        [self initViews];
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)setData:(id)data{
    
    
    if ([data isKindOfClass:[itemsModel class]]) {
        
        itemsModel *model = (itemsModel *) data;
        
        NSMutableString *contentDesc = @"".mutableCopy;
        NSMutableString *priceStr = @"".mutableCopy;
        for (int i =0; i<model.title.count; i++) {
            titleModel *title_model = model.title[i];
            if ([title_model.keyDesc isEqualToString:@"title1"]) {
                [contentDesc appendString:title_model.valueDesc];
            }
            
            if ([title_model.keyDesc isEqualToString:@"title2"]) {
                [priceStr appendString:title_model.valueDesc];
            }
            
            
        }
    
        self.productContentLabel.text = contentDesc;
        self.priceLabel.text = priceStr;
        imageUrl *leftModel  = [model.imageUrl firstObject];
        NSString *leftUrl = [urlTool getUrlwithUrl: leftModel.imgUrl];
        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:leftUrl]
                                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        

        
    }
    
}
-(void)initViews{
    
    //添加长按手势；
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 0.5;
    
    [self addGestureRecognizer:longPressGr];
    
    _preference_View = [preferenceView sharedManager];
}

-(void)addBgview{
    
    if (_preference_View==nil) {
        _preference_View = [preferenceView sharedManager];
    }

    [self addSubview:_preference_View];
    
    [_preference_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_preference_View.superview.mas_top).offset(0);
        make.bottom.equalTo(_preference_View.superview.mas_bottom).offset(0);
        make.left.equalTo(_preference_View.superview.mas_left).offset(0);
        make.right.equalTo(_preference_View.superview.mas_right).offset(0);
    }];
    
    [self layoutIfNeeded];
    
    if (self.longTapBlock!=NULL) {
        self.longTapBlock();
    }
    
    
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        [self addBgview];
    }
}



@end
