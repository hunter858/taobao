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
//    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
//    longPressGr.minimumPressDuration = 0.5;
//    
//    
//    [self addGestureRecognizer:longPressGr];
    
    preference *preferenceView = [[preference alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    
    [self addSubview:preferenceView];
    
    [preferenceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(preferenceView.superview.mas_top).offset(0);
        make.bottom.equalTo(preferenceView.superview.mas_bottom).offset(0);
        make.left.equalTo(preferenceView.superview.mas_left).offset(0);
        make.right.equalTo(preferenceView.superview.mas_right).offset(0);
    }];
    
    
    preferenceView.clickdontLikeButton = ^{
        
        NSLog(@"点击了不喜欢按钮");
    };
    
    preferenceView.clicklikeButton  = ^{
        
        NSLog(@"喜欢按钮");
    };
}
//
//-(void)addBgview{
//    
//    UIView *bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
//    [bgview setBackgroundColor:[UIColor blackColor]];
//    bgview.alpha = 0.8;
//    
//    UIButton *likeButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
//    UIButton *dontlikeButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
//    likeButton.font =[UIFont systemFontOfSize:14];
//    dontlikeButton.font =[UIFont systemFontOfSize:14];
//
//    [likeButton setTitle:@"找相似" forState:UIControlStateNormal];
//    [dontlikeButton setTitle:@"不喜欢" forState:UIControlStateNormal];
//    
//    [likeButton setBackgroundColor:[UIColor redColor]];
//    [dontlikeButton setBackgroundColor:[UIColor blueColor]];
//    
//    [bgview addSubview:likeButton];
//    [bgview addSubview:dontlikeButton];
//    
//    [self addSubview:bgview];
//    
//    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@0.1);
//        make.centerX.equalTo(bgview.superview.mas_centerX).offset(0);
//        make.centerY.equalTo(bgview.superview.mas_centerY).offset(0);
//        make.height.equalTo(@0.1);
//    }];
//    
//    [likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(likeButton.superview.mas_centerX).offset(0);
//        make.width.equalTo(likeButton.superview.mas_width).multipliedBy(0.3);
//        make.height.equalTo(likeButton.superview.mas_width).multipliedBy(0.3);
//        make.centerY.equalTo(likeButton.superview.mas_centerY).offset(50);
//        
//    }];
//    
//    [dontlikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(dontlikeButton.superview.mas_centerX).offset(0);
//        make.width.equalTo(dontlikeButton.superview.mas_width).multipliedBy(0.3);
//        make.height.equalTo(dontlikeButton.superview.mas_width).multipliedBy(0.3);
//        make.centerY.equalTo(dontlikeButton.superview.mas_centerY).offset(-50);
//    }];
//    
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(bgview.superview.mas_centerX).offset(0);
//            make.centerY.equalTo(bgview.superview.mas_centerY).offset(0);
//        }];
//        bgview.alpha = 0.8;
//        [self layoutIfNeeded];
//        
//    } completion:^(BOOL finished) {
//        
//        
//    
//        [UIView animateWithDuration:0.4 animations:^{
//            [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(bgview.superview.mas_top);
//                make.bottom.equalTo(bgview.superview.mas_bottom);
//                make.left.equalTo(bgview.superview.mas_left);
//                make.right.equalTo(bgview.superview.mas_right);
//            }];
//            bgview.alpha = 0.7;
//        }];
//                
//        [self layoutIfNeeded];
//        
//        likeButton.layer.masksToBounds = YES;
//        likeButton.layer.cornerRadius = likeButton.bounds.size.height/2;
//        dontlikeButton.layer.masksToBounds = YES;
//        dontlikeButton.layer.cornerRadius = dontlikeButton.bounds.size.height/2;
//        
//    }];
//    
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//
//    }];
//    
//
//    
//}

//-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
//{
//    if(gesture.state == UIGestureRecognizerStateBegan)
//    {
//        [self addBgview];
//    }
//}



@end
