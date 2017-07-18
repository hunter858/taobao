//
//  UIView+cover.m
//  masklayerDemo
//
//  Created by pengchao on 2017/7/18.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "UIView+cover.h"

@interface LXMRevealView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, assign) CGFloat smallDiameter;
@property (nonatomic, assign) CGFloat bigDiameter;

@end

@implementation LXMRevealView

- (instancetype)initWithTargetView:(UIView *)view {
    self = [super initWithFrame:view.bounds];
    if (self) {
        [self setupDefault];
    }
    return self;
}


- (void)setupDefault {
    self.backgroundColor = [UIColor clearColor];
    self.smallDiameter = 0;
    self.bigDiameter = sqrt(CGRectGetWidth(self.bounds)*CGRectGetWidth(self.bounds) + CGRectGetHeight(self.bounds) *CGRectGetHeight(self.bounds));
    //求平方根，获得当前 正方形，长方形的 最长 直线的长度；
    [self.layer addSublayer:self.circleLayer];
}


- (void)reveal {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [self.circleLayer removeFromSuperlayer];//理论上作为mask的layer不能有父layer，所以要remove掉
    self.superview.layer.mask = self.circleLayer;
    
    //让圆的变大的动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath *toPath = [self pathWithDiameter:self.bigDiameter];
    pathAnimation.toValue = (id)toPath.CGPath;
    pathAnimation.duration = 0.5;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnimation];
    group.duration = 0.5;
    group.removedOnCompletion = NO;//这两句的效果是让动画结束后不会回到原处，必须加
    group.fillMode = kCAFillModeForwards;//这两句的效果是让动画结束后不会回到原处，必须加
    
    [self.circleLayer addAnimation:group forKey:@"revealAnimation"];
}

/**
 *  根据直径生成圆的path，注意圆点是self的中心点，所以（x，y）不是（0，0）
 */
- (UIBezierPath *)pathWithDiameter:(CGFloat)diameter {
    
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake((CGRectGetWidth(self.bounds) - diameter) / 2, (CGRectGetHeight(self.bounds) - diameter) / 2, diameter, diameter)];
}





#pragma mark - property

- (CAShapeLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        
        _circleLayer.path = [self pathWithDiameter:self.smallDiameter].CGPath;
    }
    return _circleLayer;
}


@end


@implementation UIView (cover)

NSInteger const kLXMRevealViewTag = 1000;

- (void)setupForReveal {
    LXMRevealView *revealView = [[LXMRevealView alloc] initWithTargetView:self];
    revealView.tag = kLXMRevealViewTag;
    [self addSubview:revealView];
    [self bringSubviewToFront:revealView];
}

- (void)lxmReveal {
    LXMRevealView *revealView = (LXMRevealView *)[self viewWithTag:kLXMRevealViewTag];
    [revealView reveal];
}
@end
