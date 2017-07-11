//
//  bigmenuCell.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "bigmenuCell.h"

@implementation bigmenuCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"bigmenuCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[bigmenuCell class]])
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
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setdata:(NSArray *)array Block:(void (^)())block{
    
    
    //  取数组的第一条数据，不知道，楼主猜的；
    NSMutableArray *imageArray = @[].mutableCopy;
    for (int i=0 ; i<array.count; i++) {
        
        itemsModel *item = (itemsModel *) array[i];

        [imageArray addObject:item];
    }
    
    
    int count = 5;//一行五个icon
    CGFloat  height  = self.contentView.frame.size.height;
    
    CGFloat iconWidth = SCREEN_WIDTH/count;
    CGFloat iconHeight = height/2;
    
    for (int i= 0 ; i<10; i++) {
        
        itemsModel *item = (itemsModel *) imageArray[i];
        CGFloat x = i*iconWidth;
        CGFloat y = (i/count)*iconHeight;
        
        if (i<5) {
            
            smallIconView *iconView = [[smallIconView alloc]initWithFrame:CGRectMake(x, y, iconWidth, iconHeight)];
            [iconView setData:[item toDictionary]];
            [self.contentView addSubview:iconView];
            
        }
        if (i>=5) {
            CGFloat x = (i-5)*iconWidth;
            smallIconView *iconView = [[smallIconView alloc]initWithFrame:CGRectMake(x, y, iconWidth, iconHeight)];
            [iconView setData:[item toDictionary]];
            [self.contentView addSubview:iconView];
        }
        
        
    }
    
    
    if (block) {
        block();
    }
    
}


@end
