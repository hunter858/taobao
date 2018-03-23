//
//  titleMoreCell.m
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "titleMoreCell.h"

@implementation titleMoreCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"titleMoreCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[titleMoreCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
        }
        
        if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
            [self setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
        }
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)setData:(id)data{
    
    __weak typeof(self) weakself=self;
    if([data isKindOfClass:[itemsModel class]]){

        
        itemsModel *model = data;
        
        imageUrl *urlModel =  [ model.imageUrl firstObject];
        titleModel *title = [model.title firstObject];
        
        NSString *imageURl = [urlTool getUrlwithUrl:urlModel.imgUrl];
        self.titleLabel.text = title.valueDesc;
        [self.iconImageview sd_setImageWithURL:[NSURL URLWithString:imageURl]];
        
        
        
        
        [[self.moreControl rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             if (weakself.clickIndex!=NULL) {
                 weakself.clickIndex(model.targetUrl);
             }
             
         }];
        
    }

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
