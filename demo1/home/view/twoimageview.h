//
//  twoimageview.h
//  demo1
//
//  Created by pengchao on 2017/7/6.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTaobaoModel.h"
#import "UIImageView+WebCache.h"
#import "urlTool.h"


@interface twoimageview : UIControl
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) IBOutlet UIImageView *leftImageView;

@property (strong, nonatomic) IBOutlet UIImageView *rightImageView;

-(void)setData:(id)data;

@end
