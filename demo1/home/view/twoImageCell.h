//
//  twoImageCell.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotSaleView.h"
#import "Masonry.h"
#import "homeTaobaoModel.h"
#import "urlTool.h"
#import "UIImageView+WebCache.h"

@interface twoImageCell : UITableViewCell

//-(void)setDataleft:(id)leftdate right:(id)rightData;

-(void)setData:(NSArray *)array;

@end
