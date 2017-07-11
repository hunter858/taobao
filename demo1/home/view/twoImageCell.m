//
//  twoImageCell.m
//  demo1
//
//  Created by pengchao on 2017/7/4.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "twoImageCell.h"
#import "UIImageControl.h"

@interface twoImageCell ()

@property (nonatomic,strong)    UIImageControl *leftImageView ;
@property (nonatomic,strong)    UIImageControl *rightTopleftImageView ;
@property (nonatomic,strong)    UIImageControl *rightTopRightImageView ;
@property (nonatomic,strong)    UIImageControl *rightLeftBootImageView ;
@property (nonatomic,strong)    UIImageControl *rightRightBootImageView ;


@property (nonatomic,strong)NSMutableArray *viewArray;
@end


@implementation twoImageCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"twoImageCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[twoImageCell class]])
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(void)initViews{
    
     _leftImageView = [[UIImageControl alloc]init];
    [self.contentView addSubview:_leftImageView];
     _rightTopleftImageView = [[UIImageControl alloc]init];
    _rightTopRightImageView = [[UIImageControl alloc]init];
     _rightLeftBootImageView = [[UIImageControl alloc]init];
    _rightRightBootImageView = [[UIImageControl alloc]init];
    
    _leftImageView.userInteractionEnabled = YES;
    _rightTopleftImageView.userInteractionEnabled = YES;
    _rightTopRightImageView.userInteractionEnabled = YES;
    _rightLeftBootImageView.userInteractionEnabled = YES;
    _rightRightBootImageView.userInteractionEnabled = YES;
    
    [self.contentView  addSubview:_rightTopleftImageView];
    [self.contentView  addSubview:_rightTopRightImageView];
    [self.contentView  addSubview:_rightLeftBootImageView];
    [self.contentView  addSubview:_rightRightBootImageView];
 
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftImageView.superview.mas_top).offset(0);
        make.left.equalTo(_leftImageView.superview.mas_left).offset(0);
        make.width.equalTo(_leftImageView.superview).multipliedBy(0.4);
        make.bottom.equalTo(_leftImageView.superview.mas_bottom).offset(0);
    }];
    
    [_rightTopleftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightTopleftImageView.superview.mas_top).offset(0);
        make.left.equalTo(_leftImageView.mas_right).offset(0.5);
        make.width.equalTo(_rightTopleftImageView.superview).multipliedBy(0.3);
        make.height.equalTo(_leftImageView.superview).multipliedBy(0.5);
    }];
    [_rightTopRightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightTopRightImageView.superview.mas_top).offset(0);
        make.left.equalTo(_rightTopleftImageView.mas_right).offset(0.5);
        make.right.equalTo(_rightTopRightImageView.superview.mas_right).offset(0);
        make.height.equalTo(_rightTopRightImageView.superview).multipliedBy(0.5);
    }];
    
    [_rightLeftBootImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightTopRightImageView.mas_bottom).offset(0.5);
        make.left.equalTo(_leftImageView.mas_right).offset(0.5);
        make.width.equalTo(_rightLeftBootImageView.superview).multipliedBy(0.3);
        make.height.equalTo(_rightLeftBootImageView.superview).multipliedBy(0.5);
    }];
    [_rightRightBootImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rightTopRightImageView.mas_bottom).offset(0.5);
        make.left.equalTo(_rightLeftBootImageView.mas_right).offset(0.5);
        make.right.equalTo(_rightRightBootImageView.superview.mas_right).offset(0);
        make.height.equalTo(_rightRightBootImageView.superview).multipliedBy(0.5);
    }];

    [self layoutIfNeeded];
    
    self.viewArray = @[_leftImageView,_rightTopleftImageView,_rightTopRightImageView,_rightLeftBootImageView,_rightRightBootImageView].mutableCopy;

}



-(void)setData:(NSArray *)array{
    __weak typeof(self) weakself=self;
    
    for (int i=0 ; i<array.count; i++) {
        
        itemsModel *item = (itemsModel *) array[i];
        imageUrl *image_Url = [item.imageUrl firstObject];
        NSString *url = [urlTool getUrlwithUrl:image_Url.imgUrl];
        if (i==0) {
            
            
            [self.leftImageView.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            
            [[self.leftImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                         if (weakself.clickIndex!=NULL) {
                             weakself.clickIndex(item.targetUrl);
                         }
             }];
        }
        if (i==1) {
            
            imageUrl *second_image_Url = [item.imageUrl lastObject];
            NSString *righUrl =second_image_Url.imgUrl;
            [self.rightTopleftImageView.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            [self.rightTopRightImageView.imageView sd_setImageWithURL:[NSURL URLWithString:[urlTool getUrlwithUrl:righUrl]]
                                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            
            //点击方法
            [[self.rightTopleftImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(item.targetUrl);
                 }
             }];
            [[self.rightTopRightImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(item.targetUrl);
                 }
             }];
            
        }
        if (i==2) {
            
            imageUrl *second_image_Url = [item.imageUrl lastObject];
            NSString *righUrl =second_image_Url.imgUrl;
            [self.rightLeftBootImageView.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            [self.rightRightBootImageView.imageView sd_setImageWithURL:[NSURL URLWithString:[urlTool getUrlwithUrl:righUrl]]
                                           placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            //点击方法
            
            [[self.rightLeftBootImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(item.targetUrl);
                 }
             }];
            [[self.rightRightBootImageView rac_signalForControlEvents:UIControlEventTouchUpInside]
             subscribeNext:^(id x) {
                 if (weakself.clickIndex!=NULL) {
                     weakself.clickIndex(item.targetUrl);
                 }
             }];
            
        }
        

        
    }

    
}

@end
