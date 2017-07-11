//
//  bannerCell.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "bannerCell.h"

@implementation bannerCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"bannerCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[bannerCell class]])
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
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [self layoutIfNeeded];
        [self setupsubViews];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [self setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
        
    }
}


-(void)setData:(NSArray *)array Blcok:(void(^)())block{
    
    //  取数组的第一条数据，不知道，楼主猜的；
    NSMutableArray *imageArray = @[].mutableCopy;
    for (int i=0 ; i<array.count; i++) {
        
        itemsModel *item = (itemsModel *) array[i];
        imageUrl *image_Url = [item.imageUrl firstObject];
        [imageArray addObject:[urlTool getUrlwithUrl: image_Url.imgUrl]];
    }
    
    self.cycleScrollerView.imageURLStringsGroup = imageArray;
    
    if (block) {
        block();
    }
    
}

-(void)setupsubViews{
    
    NSArray *imageNames =@[];
    self.cycleScrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.contentView.bounds.size.height) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    self.cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    self.cycleScrollerView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.cycleScrollerView.bannerImageViewContentMode=UIViewContentModeScaleAspectFill;
    self.cycleScrollerView.autoScrollTimeInterval = 5.0;// 自动滚动时间间隔
    self.cycleScrollerView.pageDotColor = [UIColor whiteColor];
    self.cycleScrollerView.currentPageDotColor = COLOR(251, 61, 26, 1);
    
    [self.contentView addSubview:self.cycleScrollerView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
