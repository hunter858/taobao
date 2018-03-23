//
//  worthBuyingCell.m
//  demo1
//
//  Created by pengchao on 2017/7/5.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "worthBuyingCell.h"
#import "UIImageControl.h"

@interface worthBuyingCell ()

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *viewArray;
@end



@implementation worthBuyingCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"worthBuyingCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[worthBuyingCell class]])
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
        
        [self initViews];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return  self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)initViews{
    UIImageControl *view1 = [[UIImageControl alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageControl *view2 = [[UIImageControl alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageControl *view3 = [[UIImageControl alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageControl *view4 = [[UIImageControl alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];
    [self.contentView addSubview:view4];
    
    self.viewArray = @[view1,view2,view3,view4].mutableCopy;
}

-(void)setData:(NSArray *)array{
    
    __weak typeof(self) weakself=self;
    self.dataArray = array.mutableCopy;
    
    
    for (int i=0 ; i<array.count; i++) {
        
        NSDictionary *model = array[i];
        [self.dataArray addObject:model];
        itemsModel *item = (itemsModel *) array[i];
        
        imageUrl *imageModel =  [item.imageUrl firstObject];
        NSString *url = [urlTool getUrlwithUrl:imageModel.imgUrl];
        
        if (i < self.viewArray.count) {
            // 避免 view 的数量少于数据的数量，闪崩；
            UIImageControl  *imageView = self.viewArray[i];
            [imageView.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
            
            [[imageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(item.targetUrl);
                 }
                 
             }];
        }

    }
    
    [self.contentView layoutIfNeeded];
    
}


-(void)setProductData:(NSArray *)array{
    
    for (int i= 0; i<array.count; i++) {
        
        id data = array[i];
        if ([data isKindOfClass:[sectionModel class]]) {
    
           sectionModel *Model = (sectionModel *)data;
           [self.dataArray addObject:[Model.items firstObject]];
        }
    }
    
    
}


-(void)settype:(cellProductStyel)type{
    
    
    switch (type) {
        case firstStyle:
            [self case1];
            break;
        case sectionStyle:
            [self case2];
            break;
        case threeStyle:
            [self case3];
            break;
        case productStyle:
            [self case4];
            break;
        case fourTitleStyle:
            [self case5];
            break;
        case twoTitleStyle:
            [self case6];
            break;

        default:
            break;
    }
    
}

-(void)case1{
    
    //最左侧的view 0.4 右侧三个0.2比例
    
    UIImageControl  *view1 = self.viewArray[0];
    UIImageControl  *view2 = self.viewArray[1];
    UIImageControl  *view3 = self.viewArray[2];
    UIImageControl  *view4 = self.viewArray[3];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview).offset(0);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.4);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.2);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view2.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.2);
    }];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view3.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.2);
    }];
    
    [self.contentView layoutIfNeeded];
}

-(void)case2{
    
    // 这段代码好low啊 [捂脸]
    UIImageControl  *view1 = self.viewArray[0];
    UIImageControl  *view2 = self.viewArray[1];
    UIImageControl  *view3 = self.viewArray[2];
    UIImageControl  *view4 = self.viewArray[3];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview).offset(0);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.25);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.25);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view2.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.25);
    }];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view3.mas_right).offset(0.5);
        make.right.equalTo(view3.superview.mas_right).offset(0);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.25);
    }];
    
    
    [self.contentView layoutIfNeeded];
    
}

-(void)case3{
    
    // 这段代码好low啊 [捂脸]
    UIImageControl  *view1 = self.viewArray[0];
    UIImageControl  *view2 = self.viewArray[1];
    UIImageControl  *view3 = self.viewArray[2];
    UIImageControl  *view4 = self.viewArray[3];
    [view3 removeFromSuperview];
    [view4 removeFromSuperview];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview).offset(0);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.5);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview).multipliedBy(0.5);
    }];
    
    [self.contentView layoutIfNeeded];
    
    
}


-(void)case4{
    

    UIImageControl *view1 = self.viewArray[0];
    UIImageControl *view2 = self.viewArray[1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview).offset(0);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view1.superview.mas_width).multipliedBy(0.5);
    }];
    

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view1.superview).offset(0);
        make.bottom.equalTo(view1.superview).offset(0);
        make.width.equalTo(view2.superview.mas_width).multipliedBy(0.5);

    }];
    
    [self.contentView layoutIfNeeded];
}




-(void)case5{
    
    while (self.contentView.subviews.count>0) {
        
        [[self.contentView.subviews lastObject] removeFromSuperview];
    }
    //移除之前的 UIImageView
    
    __weak typeof(self) weakself=self;
    
    oneImageView *view1 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view2 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view3 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view4 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];
    [self.contentView addSubview:view4];
    [self.viewArray removeAllObjects];
    self.viewArray = @[view1,view2,view3,view4].mutableCopy;
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview.mas_left).offset(0);
        make.top.equalTo(view1.superview.mas_top).offset(0);
        make.bottom.equalTo(view1.superview.mas_bottom).offset(0);
        make.width.equalTo(view1.superview.mas_width).multipliedBy(0.25);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view2.superview.mas_top).offset(0);
        make.bottom.equalTo(view2.superview.mas_bottom).offset(0);
        make.width.equalTo(view2.superview.mas_width).multipliedBy(0.25);
    }];

    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view2.mas_right).offset(0.5);
        make.top.equalTo(view3.superview.mas_top).offset(0);
        make.bottom.equalTo(view3.superview.mas_bottom).offset(0);
        make.width.equalTo(view3.superview.mas_width).multipliedBy(0.25);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view3.mas_right).offset(0.5);
        make.top.equalTo(view4.superview.mas_top).offset(0);
        make.bottom.equalTo(view4.superview.mas_bottom).offset(0);
        make.width.equalTo(view4.superview.mas_width).multipliedBy(0.25);
    }];

    
    for (int i=0; i<self.viewArray.count; i++) {
        
        oneImageView *oneView = self.viewArray[i];
        if (i<self.dataArray.count) {
            itemsModel *model = self.dataArray[i];
            [oneView setData:model];
            
            [[oneView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(model.targetUrl);
                 }
                 
             }];
            
        }
        
        
    }
    
    [self layoutIfNeeded];
}

-(void)case6{
    
    //cell 5-5 分，标题原生
    
    while (self.contentView.subviews.count>0) {
        
        [[self.contentView.subviews lastObject] removeFromSuperview];
    }
    //移除之前的 UIImageView
    
    __weak typeof(self) weakself=self;
    
    
    twoimageview *view1 = [[twoimageview alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    twoimageview *view2 = [[twoimageview alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.viewArray removeAllObjects];
    self.viewArray = @[view1,view2].mutableCopy;
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.superview.mas_left).offset(0);
        make.top.equalTo(view1.superview.mas_top).offset(0);
        make.bottom.equalTo(view1.superview.mas_bottom).offset(0);
        make.width.equalTo(view1.superview.mas_width).multipliedBy(0.5);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(0.5);
        make.top.equalTo(view2.superview.mas_top).offset(0);
        make.bottom.equalTo(view2.superview.mas_bottom).offset(0);
        make.width.equalTo(view2.superview.mas_width).multipliedBy(0.5);
    }];
    
    
    [self layoutIfNeeded];
    
    for (int i=0; i<self.viewArray.count; i++) {
        
        twoimageview *oneView = self.viewArray[i];
        if (i<self.dataArray.count) {
            itemsModel *model = self.dataArray[i];
            [oneView setData:model];
            
            [[oneView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(model.targetUrl);
                 }
                 
             }];
        }
        
        
    }
    
    
}



-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
