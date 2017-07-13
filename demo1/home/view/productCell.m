//
//  productCell.m
//  demo1
//
//  Created by pengchao on 2017/7/13.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "productCell.h"

@implementation productCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"productCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[productCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self.frame=frame;
        [self initViews];
        [self layoutIfNeeded];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}

-(void)initViews{
    

    //移除之前的 UIImageView
    productView *productView1 = [[productView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    productView *productView2 = [[productView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:productView1];
    [self.contentView addSubview:productView2];
    [self.viewArray removeAllObjects];
    self.viewArray = @[productView1,productView2].mutableCopy;
    
    [productView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(productView1.superview.mas_left).offset(0);
        make.top.equalTo(productView1.superview.mas_top).offset(0);
        make.bottom.equalTo(productView1.superview.mas_bottom).offset(-5);
    }];
    
    
    [productView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(productView1.mas_right).offset(5);
        make.top.equalTo(productView2.superview.mas_top).offset(0);
        make.bottom.equalTo(productView2.superview.mas_bottom).offset(-5);
        make.right.equalTo(productView2.superview.mas_right).offset(0);
        make.width.equalTo(productView1.mas_width);
    }];
    
    [self layoutIfNeeded];
    

    self.index = nil;
 
    
}

-(void)setIndex:(NSIndexPath *)index {
    
    if (_index==nil) {
        _index = [[NSIndexPath alloc]init];
    }
    _index = index.copy;
    
}

-(void)setData:(NSArray *)array{
    
    __weak typeof(self) weakself=self;
    for (int i= 0; i<array.count; i++) {
        
        id data = array[i];
        if ([data isKindOfClass:[sectionModel class]]) {
            sectionModel *Model = (sectionModel *)data;
            [self.dataArray addObject:[Model.items firstObject]];
        }
    }
    
    
    for (int i=0; i<self.viewArray.count; i++) {
        
        productView *oneView = self.viewArray[i];
        if (i<self.dataArray.count) {
            itemsModel *model = self.dataArray[i];
            [oneView setData:model];
            
            [[oneView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(model.targetUrl);
                 }
                 
             }];
            
            oneView.preference_View.clicklikeButton =^(NSString *URL){
                
                if (weakself.clickLikeButton!=NULL) {
                    weakself.clickLikeButton(weakself.index);
                }
                
            };
            
            oneView.preference_View.clickdontLikeButton =^(NSString *URL){
                
                if (weakself.clickdontLikeButton!=NULL) {
                    weakself.clickdontLikeButton(weakself.index);
                }
                
            };
            
            
        }
        
        
    }
    
    
}

-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray =@[].mutableCopy;
    }
    return _dataArray;
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
