//
//  limitSaleCell.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "limitSaleCell.h"
#import "UIImageView+WebCache.h"
#import "UIImageControl.h"

@interface limitSaleCell ()
@property (strong, nonatomic) UIImageControl *showImageView;

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
    
    self.showImageView = [[UIImageControl alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    [self.contentView addSubview:self.showImageView];
    
    [_showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_showImageView.superview.mas_top).offset(0);
        make.bottom.equalTo(_showImageView.superview.mas_bottom).offset(0);
        make.left.equalTo(_showImageView.superview.mas_left).offset(0);
        make.right.equalTo(_showImageView.superview.mas_right).offset(0);
    }];
}

- (void)setData:(NSArray *)array{
    
    
    itemsModel *model = (itemsModel *)[array firstObject];
    imageUrl *imageUrl = [model.imageUrl firstObject];
    NSString *url = [urlTool getUrlwithUrl:imageUrl.imgUrl];
    [self.showImageView.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    __weak typeof(self) weakself=self;
    [[self.showImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         if (weakself.clickIndex!=NULL) {
             weakself.clickIndex(model.targetUrl);
         }
         
     }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
