//
//  UIImageControl.m
//  demo1
//
//  Created by pengchao on 2017/7/11.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "UIImageControl.h"

@implementation UIImageControl

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return  self;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        [self initViews];
    }
    return  self;
    
}

-(void)initViews{
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.superview.mas_top);
        make.bottom.equalTo(_imageView.superview.mas_bottom);
        make.left.equalTo(_imageView.superview.mas_left);
        make.right.equalTo(_imageView.superview.mas_right);
    }];
    [self layoutIfNeeded];
    
}
-(UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    }
    return  _imageView;
}
@end
