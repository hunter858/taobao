//
//  titleMoreCell.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleMoreCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageview;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *MoreView;


@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);


-(void)setData:(id )data;

@end
