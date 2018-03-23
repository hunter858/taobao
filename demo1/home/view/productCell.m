//
//  productCell.m
//  demo1
//
//  Created by pengchao on 2017/7/13.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "productCell.h"

@interface productCell ()
@property (nonatomic,strong) NSMutableArray *tempDataArray;
@end

@implementation productCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
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
    return self;
}



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
    
    
 
    
}


-(void)setData:(NSArray *)array{
    
    __weak typeof(self) weakself=self;
//    if (self.tempDataArray.count>0) {
//        
//       
//
//        self.dataArray = self.tempDataArray.mutableCopy;
//        
//        
//    }else{
//        for (int i= 0; i<array.count; i++) {
//            
//            id data = array[i];
//            if ([data isKindOfClass:[sectionModel class]]) {
//                sectionModel *Model = (sectionModel *)data;
//                [self.dataArray addObject:[Model.items firstObject]];
//            }
//        }
//    }
    if((self.dataArray!=nil)&&(self.dataArray.count>0)){
         [self.dataArray removeAllObjects];
         //移除之前的数据模型
    }
        

    
    for (int i= 0; i<array.count; i++) {

        id data = array[i];
        if ([data isKindOfClass:[sectionModel class]]) {
            sectionModel *Model = (sectionModel *)data;
            [self.dataArray addObject:[Model.items firstObject]];
        }
    }
    
//    self.dataArray = array;
    
    
    //这段代码比较low ，但是我还没找到好的解决方法
    {
            productView *leftProductView = [self.viewArray firstObject];
            itemsModel *model = [self.dataArray firstObject];
            [leftProductView setData:model];
            
            [[leftProductView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(model.targetUrl);
                 }
                 
             }];
            
            __weak typeof(leftProductView) weakleftView=leftProductView;
            
            leftProductView.longTapBlock = ^(){
                weakleftView.preference_View.clicklikeButton =^(NSString *URL){
                    
                    if (weakself.clickLeftLikeButton!=NULL) {
                        weakself.clickLeftLikeButton(weakself.index);
                    }
                    
                };
                
                weakleftView.preference_View.clickdontLikeButton =^(NSString *URL){
                    
                    if (weakself.clickLeftDontLikeButton!=NULL) {
                        weakself.clickLeftDontLikeButton(weakself.index);
                    }
                    
                };
           };
            
    }
    
    {
        productView *rightProductView = [self.viewArray lastObject];
        itemsModel *model = [self.dataArray lastObject];
        [rightProductView setData:model];
        
        [[rightProductView rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             if (weakself.clickIndex!=NULL) {
                 weakself.clickIndex(model.targetUrl);
             }
             
         }];
        
        __weak typeof(rightProductView) weakRightView=rightProductView;
        
        rightProductView.longTapBlock = ^(){
            weakRightView.preference_View.clicklikeButton =^(NSString *URL){
                
                if (weakself.clickRightLikeButton!=NULL) {
                    weakself.clickRightLikeButton(weakself.index);
                }
                
            };
            
            weakRightView.preference_View.clickdontLikeButton =^(NSString *URL){
                
                if (weakself.clickRightDontLikeButton!=NULL) {
                    weakself.clickRightDontLikeButton(weakself.index);
                }
                
            };
        };
        
    }
    
    
    
    
}

-(void)setleftData:(id)data{
    
    if ([data isKindOfClass:[sectionModel class]]) {
        sectionModel  *section =(sectionModel *)data;
        itemsModel *model = [section.items firstObject];
        id firstObject = [self.dataArray firstObject];
        [self.dataArray removeObject:firstObject];
        [self.dataArray insertObject:model atIndex:0];
        
        self.tempDataArray = self.dataArray.mutableCopy;
    }
    
}
-(void)setRightData:(id)data{
 
    if ([data isKindOfClass:[sectionModel class]]) {
        sectionModel  *section =(sectionModel *)data;
        itemsModel *model = [section.items lastObject];
        
        id lastObject = [self.dataArray lastObject];
        [self.dataArray removeObject:lastObject];
        [self.dataArray addObject:model];
        self.tempDataArray = self.dataArray.mutableCopy;
    }
    
}

-(void)reloadCell{
    
    [self setData:self.dataArray];
    [self layoutIfNeeded];
    
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}
-(NSMutableArray *)tempDataArray{
    if (!_tempDataArray) {
        _tempDataArray = @[].mutableCopy;
    }
    return _tempDataArray;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"重新调用");
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
