//
//  ViewController.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "ViewController.h"
#import "homeViewModel.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    __weak typeof(self) weakself=self;
    _viewModel  =[[homeViewModel alloc]init];
    [_viewModel.tableViewDataModel targetTableView:self.mytableview];
    [_viewModel setData:^{
        [weakself.mytableview reloadData];
    }];


}

-(void)initviews{
    __weak typeof(self) weakself=self;
    [self.mytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top).offset(0);
        make.bottom.equalTo(weakself.view.mas_bottom).offset(0);
        make.left.equalTo(weakself.view.mas_left).offset(0);
        make.right.equalTo(weakself.view.mas_right).offset(0);
    }];
    [self.view layoutIfNeeded];
    self.mytableview.separatorColor = COLOR(234, 234, 234, 0.5);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews{
    //    __weak typeof(self) weakself=self;
    
    if ([self.mytableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.mytableview setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    
    if ([self.mytableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.mytableview setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    
    self.mytableview.tableFooterView =[[UIView alloc]init];
    [self.mytableview setBackgroundColor:[UIColor whiteColor]];
    self.mytableview.separatorColor =COLOR(232, 232, 232, 1);
}

@end
