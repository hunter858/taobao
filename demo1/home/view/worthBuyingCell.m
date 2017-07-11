//
//  worthBuyingCell.m
//  demo1
//
//  Created by pengchao on 2017/7/5.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "worthBuyingCell.h"

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
    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageView *view2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageView *view3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    UIImageView *view4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];
    [self.contentView addSubview:view4];
    
    self.viewArray = @[view1,view2,view3,view4].mutableCopy;
}

-(void)setData:(NSArray *)array{
    
    
    self.dataArray = array.mutableCopy;
    
    
    for (int i=0 ; i<array.count; i++) {
        
        NSDictionary *model = array[i];
        [self.dataArray addObject:model];
        itemsModel *item = (itemsModel *) array[i];
        
        imageUrl *imageModel =  [item.imageUrl firstObject];
        NSString *url = [urlTool getUrlwithUrl:imageModel.imgUrl];
        
        if (i < self.viewArray.count) {
            // 避免 view 的数量少于数据的数量，闪崩；
            UIImageView  *imageView = self.viewArray[i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
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
        case product:
            [self case7];
            break;

        default:
            break;
    }
    
}

-(void)case1{
    
    //最左侧的view 0.4 右侧三个0.2比例
    
    UIImageView  *view1 = self.viewArray[0];
    UIImageView  *view2 = self.viewArray[1];
    UIImageView  *view3 = self.viewArray[2];
    UIImageView  *view4 = self.viewArray[3];
    
    
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
    UIImageView  *view1 = self.viewArray[0];
    UIImageView  *view2 = self.viewArray[1];
    UIImageView  *view3 = self.viewArray[2];
    UIImageView  *view4 = self.viewArray[3];
    
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
    UIImageView  *view1 = self.viewArray[0];
    UIImageView  *view2 = self.viewArray[1];
    UIImageView  *view3 = self.viewArray[2];
    UIImageView  *view4 = self.viewArray[3];
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
    

    UIImageView *view1 = self.viewArray[0];
    UIImageView *view2 = self.viewArray[1];
    
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
    
    oneImageView *view1 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view2 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view3 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    oneImageView *view4 = [[oneImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];
    [self.contentView addSubview:view4];
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
    
    
//    [view1 setBackgroundColor:[UIColor redColor]];
//    [view2 setBackgroundColor:[UIColor blueColor]];
//    [view3 setBackgroundColor:[UIColor blackColor]];
//    [view4 setBackgroundColor:[UIColor greenColor]];
    
    [view1 setData:self.dataArray[0]];
    [view2 setData:self.dataArray[1]];
    [view3 setData:self.dataArray[2]];
    [view4 setData:self.dataArray[3]];
    
    [self layoutIfNeeded];
}

-(void)case6{
    
    //cell 5-5 分，标题原生
    
    while (self.contentView.subviews.count>0) {
        
        [[self.contentView.subviews lastObject] removeFromSuperview];
    }
    //移除之前的 UIImageView
    
    twoimageview *view1 = [[twoimageview alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    twoimageview *view2 = [[twoimageview alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    
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
    
    [view1 setData:self.dataArray[0]];
    [view2 setData:self.dataArray[1]];
    
    
    [self layoutIfNeeded];
}

-(void)case7{
    
    while (self.contentView.subviews.count>0) {
        
        [[self.contentView.subviews lastObject] removeFromSuperview];
    }
    //移除之前的 UIImageView
    productView *productView1 = [[productView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    productView *productView2 = [[productView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.contentView addSubview:productView1];
    [self.contentView addSubview:productView2];
    
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
    [productView1 setBackgroundColor:[UIColor redColor]];
    [productView2 setBackgroundColor:[UIColor blueColor]];
    [productView1 setData:self.dataArray[0]];
    [productView2 setData:self.dataArray[1]];
    [self layoutIfNeeded];
    
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
