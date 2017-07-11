//
//  preference.h
//  demo1
//
//  Created by pengchao on 2017/7/11.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


@interface preferenceView : UIView
@property (nonatomic,strong)UIButton *likeButton;
@property (nonatomic,strong)UIButton *dontlikeButton;
@property (nonatomic,strong)UIView *bgview;

@property (nonatomic,copy)void (^clicklikeButton)();
@property (nonatomic,copy)void (^clickdontLikeButton)();
@end
