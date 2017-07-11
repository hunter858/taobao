//
//  oneImageView.h
//  demo1
//
//  Created by pengchao on 2017/7/10.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTaobaoModel.h"
#import "UIImageView+WebCache.h"
#import "urlTool.h"

@interface oneImageView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
-(void)setData:(id)data;
@end
