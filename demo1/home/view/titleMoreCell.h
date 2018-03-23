//
//  titleMoreCell.h
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleMoreCell : UITableViewCell
//左侧图片
@property (strong, nonatomic) IBOutlet UIImageView *leftimageView;

//居中图片和title
@property (strong, nonatomic) IBOutlet UIImageView *iconImageview;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *MoreView;


//右侧title 和icon
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;
@property (strong, nonatomic) IBOutlet UIImageView *rightIcon;

@property (nonatomic,copy) void (^clickIndex)(NSString *clickIndex);

@property (strong, nonatomic) IBOutlet UIControl *moreControl;



-(void)setData:(id )data;

@end
