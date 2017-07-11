//
//  noticeView.m
//  demo1
//
//  Created by pengchao on 2017/7/9.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "noticeView.h"

@interface noticeView ()
@property (strong, nonatomic) IBOutlet UIControl *bgControl;
@property (strong, nonatomic) IBOutlet UILabel *tagLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end


@implementation noticeView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"noticeView" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[noticeView class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)setData:(id)data{
    
    
    
    //    NSString *tag = @"热评";
//    NSString *content =@"开网吧的很怕挨着手机店，这是为什么？";

    self.tagLabel.text = @"热议";
    self.contentLabel.text = @"一夜之间爆降2000，跳水我只服气HTC";
    
}


-(void)awakeFromNib{
    //重写绘图方法 给label画圆角 ，并且不压住字体
    
    self.tagLabel.textColor =[UIColor greenColor];
    self.tagLabel.textAlignment = NSTextAlignmentCenter;
    self.tagLabel.layer.masksToBounds = YES;
    self.tagLabel.layer.cornerRadius = self.bounds.size.height/2;
    self.tagLabel.layer.borderWidth = 0.5;
    self.tagLabel.layer.borderColor = [UIColor greenColor].CGColor;
//    [self setBackgroundColor:[self Color:color WidthAlpha:0.05]];
//    if (font==nil) {
//        self.font =[UIFont systemFontOfSize:12];
//    }
    
    
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width/2;//最大宽
//    CGSize realSize = [STStringUnitTool GetSizeWithString:title withMaxSize:CGSizeMake(width, MAXFLOAT) withFont:font];
//    self.tagLabel.bounds =CGRectMake(0, 0, realSize.width+8, realSize.height);
    [self layoutIfNeeded];
    
}


@end
