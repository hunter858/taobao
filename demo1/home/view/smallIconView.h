//
//  smallIconView.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "homeTaobaoModel.h"
#import "UIImageView+WebCache.h"
#import "urlTool.h"

@interface smallIconView : UIControl

-(void)setData:(id)object;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
