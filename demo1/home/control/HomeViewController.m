//
//  HomeViewController.m
//  demo1
//
//  Created by pengchao on 2017/7/11.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *mytableview;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initviews];
    __weak typeof(self) weakself=self;
    _viewModel  =[[homeViewModel alloc]init];
    [_viewModel.tableViewDataModel targetTableView:self.mytableview];
    [_viewModel setData:^{
        [weakself.mytableview reloadData];
    }];
    
    _viewModel.reloadTableview = ^(NSIndexPath *index) {
        if (index!=nil) {
            [weakself.mytableview reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationLeft];
        }
       
    };

}

-(void)initviews{
    __weak typeof(self) weakself=self;
    [self.mytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top).offset(0);
        make.bottom.equalTo(weakself.view.mas_bottom).offset(0);
        make.left.equalTo(weakself.view.mas_left).offset(0);
        make.right.equalTo(weakself.view.mas_right).offset(0);
    }];
    [self.mytableview layoutIfNeeded];
    self.mytableview.separatorColor = COLOR(234, 234, 234, 0.5);
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
