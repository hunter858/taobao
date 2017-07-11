//
//  ViewController.h
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeViewModel.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *mytableview;
@property (nonatomic,strong) homeViewModel *viewModel;
@end

