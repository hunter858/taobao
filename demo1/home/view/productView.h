//
//  productView.h
//  demo1
//
//  Created by pengchao on 2017/7/10.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTaobaoModel.h"
#import "UIImageView+WebCache.h"
#import "urlTool.h"
#import "Masonry.h"
#import "preferenceView.h"

@interface productView : UIControl
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
@property (strong, nonatomic) IBOutlet UILabel *productContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;

-(void)setData:(id)data;

@end
