//
//  UIView+cover.h
//  masklayerDemo
//
//  Created by pengchao on 2017/7/18.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LXMRevealView : UIImageView

- (instancetype)initWithTargetView:(UIView *)view;

- (void)reveal;

@end

@interface UIView (cover)
- (void)setupForReveal;

- (void)lxmReveal;

@end
