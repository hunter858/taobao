//
//  advertisementCell.m
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "advertisementCell.h"
#import "SDCycleScrollView.h"

@interface advertisementCell ()
@property (strong, nonatomic) IBOutlet UIView *rightView;
@property (nonatomic,strong)SDCycleScrollView *cycleScrollerView;
@end


@implementation advertisementCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"advertisementCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[advertisementCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsMake(0,SCREEN_WIDTH,0,0)];
        }
        
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsMake(0,SCREEN_WIDTH,0,0)];
        }
        [self initViews];
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)initViews{
    
    
    //作者太懒啦，不想自己写一个轮播器，就用 SDCycleScrollView 的好啦，把需要显示的view 塞上去就能用
    //我真的是太懒了 【捂脸】
    //会有个bug 就是，手工滚动的话，公告也会跟着滚动的
    
    NSArray *imageNames =@[@"whiteBg",
                           @"whiteBg",
                           @"whiteBg"];
    
    CGRect bounds = self.rightView.bounds;
    self.cycleScrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height) shouldInfiniteLoop:YES imageNamesGroup:imageNames];

    self.cycleScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
    self.cycleScrollerView.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.cycleScrollerView.bannerImageViewContentMode=UIViewContentModeScaleAspectFill;
    self.cycleScrollerView.autoScrollTimeInterval = 3.0;
    [self.rightView addSubview:self.cycleScrollerView];
    
    [self.rightView layoutIfNeeded];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
