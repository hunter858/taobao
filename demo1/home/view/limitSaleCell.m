//
//  limitSaleCell.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "limitSaleCell.h"
#import "UIImageView+WebCache.h"
@interface limitSaleCell ()
@property (strong, nonatomic) IBOutlet UIImageView *showImageView;

@end


@implementation limitSaleCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"limitSaleCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[limitSaleCell class]])
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

- (void)setData:(NSArray *)array{
    
    itemsModel *model = (itemsModel *)[array firstObject];
    imageUrl *imageUrl = [model.imageUrl firstObject];
    NSString *url = [urlTool getUrlwithUrl:imageUrl.imgUrl];
    [self.showImageView sd_setImageWithURL:[NSURL URLWithString:url]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
