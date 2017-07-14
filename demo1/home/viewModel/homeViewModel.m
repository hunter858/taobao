//
//  homeViewModel.m
//  demo1
//
//  Created by pengchao on 2017/7/3.
//  Copyright © 2017年 pengchao. All rights reserved.
//

#import "homeViewModel.h"
#import "homeTaobaoModel.h"


@interface homeViewModel ()
@property (nonatomic,strong) homeTaobaoModel *Model;
@property (nonatomic,strong) homeTaobaoModel *productModel;
@end

@implementation homeViewModel


-(instancetype)init{
    self = [super init];
    if (self) {
        self.tableViewDataModel = [[TableViewDataModel alloc]init];
    }
    return self;
}

// 第一大 方法 very important
-(void)setData:(void (^)())callback{
    [self loadData];
    
    [self setScrollviewCell];  //滚动轮播器
    [self setBigMenuCell];     //大菜单
//    [self setAdvertisementCell];
    [self setSpacewithHeight:8];
    
    [self setseaSaleCell];
    [self setSpacewithHeight:8];
    
    [self worthByArrayCell];   //超实惠
    [self setSpacewithHeight:8];
    
    [self addTmallmustBuyCell]; //天猫避必逛
    [self setSpacewithHeight:8];
    
    [self addGlobalBuyCell];   // 全球购
    [self setLimitSaleCell];   //广告；
    [self setSpacewithHeight:8];
    
    [self setHotMarketTitleCell];
    [self sethotMarketCell];  //热门市场
    [self setSpacewithHeight:8];
    
    [self addProductCell];    //重量级的产品数据，佩服taobao数据真多 200多条
    
    
    if(callback){
        callback();
    }
}

-(void)reloadTableview:(void(^)())callback{
    
    
    
    if(callback){
        callback();
    }
        
}



-(void)loadData{
    //加载本地json 数据，该数据是我用charles 抓到的 taobao h5的请求数据；
    //我是在不想一条条造假数据了，费劲, 请各位看官不要吐槽😍　

    //推荐内容 分组数据
    self.Model = [self getDataWithPath:@"taobao.json"];
    
    //产品数据
    self.productModel = [self getDataWithPath:@"taobaoProduct.json"];
    
    NSLog(@"xxx");
}

-(homeTaobaoModel *)getDataWithPath:(NSString *)path{
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
    //加载JSON文件
    NSData *data = [NSData dataWithContentsOfFile:filepath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *DataModel = [dict objectForKey:@"data"];
    homeTaobaoModel *Model = [[homeTaobaoModel alloc]initWithDictionary:DataModel error:nil];
    return Model;
}



-(TableViewSectionModel *)getSectionModel{
    TableViewSectionModel *sectionModel=[self.tableViewDataModel.tableViewDataArr firstObject];
    if (sectionModel==nil) {
        sectionModel=[[TableViewSectionModel alloc] init];
        [self.tableViewDataModel.tableViewDataArr addObject:sectionModel];
    }
    return sectionModel;
}


-(void)setScrollviewCell{

    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    bannerCell *cell =[[bannerCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    //1.创建一个cell 通过 initWithFrame 的方法；
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 120;
    };
    //2.实现CellModel 的 CellHeight block 属性， 返回 cell 高度;
    
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    //3.实现CellModel的block  返回UITableViewCell
    
    [cell setData:[self getDataArray:@"tbanner"] Blcok:^{
        
    }];
    //4.给cell赋值，放入数据模型；
    
    cell.clickIndex = ^(NSString *URL){
        [AppRouterTool pushWithUrl:URL];   //这是一个跳转方法
    };
    //5.实现cell 的点击事件;
    
    
    [sectionModel.cellModelsArr addObject:banner];
    //6.将cellModel，放到 第一个TableViewSectionModel 对象中
    
    
}

-(void)setBigMenuCell{

    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    bigmenuCell *cell =[[bigmenuCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    
    [cell setdata:[self getDataArray:@"tentrance10"] Block:^{
        
    }];
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 160;
    };
    
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    cell.clickIndex = ^(NSString *URL){
        
        [AppRouterTool pushWithUrl:URL];
        
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}

-(void)setLimitSaleCell{
    
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    limitSaleCell *cell =[[limitSaleCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 76)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 76;
    };
    
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    [cell setData:[self getDataArray:@"tbanner2"]];
    cell.clickIndex = ^(NSString *URL){
        [AppRouterTool pushWithUrl:URL];
    };
    [sectionModel.cellModelsArr addObject:banner];
}

-(void)setAdvertisementCell{

    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    advertisementCell *cell =[[advertisementCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 60;
    };
    
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}


-(void)setseaSaleCell{
    
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    twoImageCell *cell =[[twoImageCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 190;
    };
    [cell setData:[self getDataArray:@"trushbuy5"]];

    cell.clickIndex = ^(NSString *URL){
        
        [AppRouterTool pushWithUrl:URL];
        
    };
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}


-(void)setSpacewithHeight:(CGFloat)height{
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    UITableViewCell *cell =[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
    [cell setBackgroundColor:RGB(232, 233,232)];
    
    //如果cell 响应这个方法，就设置cell 的分割线的 Edge 为屏幕宽度，也就是不显示cell 分割线
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0,SCREEN_WIDTH,0,0)];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0,SCREEN_WIDTH,0,0)];
    }
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return height;
    };
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}
-(void)setTitleMoreCell:(id)data{
    
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    titleMoreCell *cell =[[titleMoreCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 30;
    };
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    [cell setData:data];
    cell.clickIndex = ^(NSString *URL){
        
        [AppRouterTool pushWithUrl:URL];
        
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}


-(void)worthByArrayCell{
    
    NSArray *allData = [self getDataArray:@"tcheap5"];
    
    //1.title cell (第一个item 其实是标题)
    
    itemsModel *item = (itemsModel *)[allData firstObject];
    [self setTitleMoreCell:item];
    
    //2.proudct Cell
    NSMutableArray *array = @[].mutableCopy;
    
    for (int i = 1; i<allData.count; i++) {
        
        [array addObject:allData[i]];
        
        if(i%4==0){
            //4个一组
            [self worthBuyingCell:array];
            [array removeAllObjects];// 清空
        }
    }
    
}

-(void)worthBuyingCell:(NSArray *)array{
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    worthBuyingCell *cell =[[worthBuyingCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 115;
    };
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    cell.clickIndex = ^(NSString *URL){
        
        [AppRouterTool pushWithUrl:URL];
        
    };
    
    [cell setData:array];
    [cell settype:firstStyle];
    [sectionModel.cellModelsArr addObject:banner];
}


-(void)addTmallmustBuyCell{
    
    //1.title cell (第一个item 其实是标题)
    NSArray *allData = [self getDataArray:@"tmall5"];
    itemsModel *item = (itemsModel *)[allData firstObject];
    [self setTitleMoreCell:item];
    
    //2.天猫必买的产品内容
    NSMutableArray *twoProductArray = @[].mutableCopy;
    NSMutableArray *fourProductArray = @[].mutableCopy;
    for (int i = 1; i<allData.count; i++) {
        
        if (i<3) {
            [twoProductArray addObject:allData[i]];
        }
        if ((i>=3)&&(i<allData.count)){
            [fourProductArray addObject:allData[i]];
        }
    }
    
    
    [self hotmarketCell:twoProductArray type:productStyle];
    [self hotmarketCell:fourProductArray type:sectionStyle];
    
    
}

-(void)addGlobalBuyCell{
    
    //1.title cell (第一个item 其实是标题)
    NSArray *allData = [self getDataArray:@"tfeatures5"];
    itemsModel *item = (itemsModel *)[allData firstObject];
    [self setTitleMoreCell:item];
    
    
    //全球购

    NSMutableArray *twoProductArray = @[].mutableCopy;
    NSMutableArray *fourProductArray = @[].mutableCopy;
    for (int i = 1; i<allData.count; i++) {
        
        if (i<5) {
            [twoProductArray addObject:allData[i]];
        }
        if ((i>=5)&&(i<allData.count)){
            [fourProductArray addObject:allData[i]];
        }
    }
    
    
    [self hotmarketCell:twoProductArray type:firstStyle];
    [self hotmarketCell:fourProductArray type:firstStyle];
}


-(void)setHotMarketTitleCell{
    //热门市场 title cell
    NSArray *allData = [self getDataArray:@"tcategory5_header"];
    itemsModel *item = (itemsModel *)[allData firstObject];
    [self setTitleMoreCell:item];
    
}

-(void)sethotMarketCell{
    
    
//    NSArray *allData = [self getDataArray:@"tfeatures5"];
    
    //1.全球购
    NSArray *firstData = [self getDataArray:@"tcategory5_4i4pic"];
    
    //刚好4条数据
    [self hotmarketCell:firstData type:fourTitleStyle];
    
    NSArray *secondData = [self getDataArray:@"tcategory5_2i4pic"];
    //2条数据
    [self hotmarketCell:secondData type:twoTitleStyle];
    
    
    NSArray *threeData = [self getDataArray:@"tcategory5_2i4pic"];
    //4条数据
    NSRange range = NSMakeRange (2, 4);
    threeData =  [threeData subarrayWithRange:range];    
    [self hotmarketCell:threeData type:fourTitleStyle];
    
}


-(void)hotmarketCell:(NSArray *)array type:(cellProductStyel)type{
    //热门市场
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    worthBuyingCell *cell =[[worthBuyingCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 115;
    };
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        return cell;
    };
    cell.clickIndex = ^(NSString *URL){
        
        [AppRouterTool pushWithUrl:URL];
        
    };
    
    [cell setData:array];
    [cell settype:type];
    [sectionModel.cellModelsArr addObject:banner];
}


-(void)addProductCell{
    
    NSInteger cellCount =  self.productModel.section.count/2;
    NSInteger totalCount = self.productModel.section.count;
    // for 循环一次取2个数据，放进cell里面；
    
    for (NSInteger i =0; i<cellCount; i++) {
        NSMutableArray *array = @[].mutableCopy;

        if(i*2<totalCount){
            [array addObject:self.productModel.section[i*2]];
        }
        if((i*2+1)<totalCount){
            [array addObject:self.productModel.section[i*2+1]];
        }
        
        
        [self addProductCell:array];
    }
    
    
    
}

-(void)addProductCell:(NSArray*)data{
    TableViewSectionModel *sectionModel=[self getSectionModel];
    CellModel *banner =[[CellModel alloc]init];
    
    static NSString *identifier = @"productCell";
    
    
    banner.CellHeight = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 230;
    };

    __weak typeof(self) weakself=self;
    
    banner.Cell=^UITableViewCell*(UITableView *tableView,NSIndexPath* indexPath){
        
        productCell *cell = [self.tableViewDataModel.tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell==nil) {
            cell = [[productCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        [cell setData:data];
        
        cell.clickIndex = ^(NSString *URL){
            [AppRouterTool pushWithUrl:URL];
        };
        
        cell.index = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        
        
        __weak typeof(cell) weakCell = cell;
        
        //点击了产品的喜欢按钮 (左侧)
        //在这里 取拿一个新的产品，然后刷新tableview 就可以了
        cell.clickLeftLikeButton = ^(NSIndexPath *index) {
            
            [weakCell setleftData:weakself.getRandomData]; //搞一个假数据 刷新tableview
            
            if (weakself.reloadTableview!=NULL) {
                weakself.reloadTableview(index);
            }
            
        };
        //点击了产品的不喜欢按钮 (左侧)
        cell.clickLeftDontLikeButton  = ^(NSIndexPath *index) {
            [weakCell setleftData:weakself.getRandomData];
            if (weakself.reloadTableview!=NULL) {
                weakself.reloadTableview(index);
            }
        };
        
        //点击了产品的喜欢按钮 (右侧)
        cell.clickRightLikeButton = ^(NSIndexPath *index) {
            
            [weakCell setRightData:weakself.getRandomData]; //搞一个假数据 刷新tableview
            
            if (weakself.reloadTableview!=NULL) {
                weakself.reloadTableview(index);
            }
            
        };
        
        //点击了产品的不喜欢按钮 (右侧)
        cell.clickRightDontLikeButton  = ^(NSIndexPath *index) {
            [weakCell setRightData:weakself.getRandomData];
            if (weakself.reloadTableview!=NULL) {
                weakself.reloadTableview(index);
            }
        };
        
        
        
        return cell;
    };
    
    [sectionModel.cellModelsArr addObject:banner];
}


// 一个随机产品数据的方法

-(sectionModel *)getRandomData{
    
    NSInteger count = self.productModel.section.count; //所有产品数据的数量
    NSInteger value = arc4random_uniform(count + 1);   //在所有产品中随机一个产品
    sectionModel *model = nil;
    if (value<count) {
        //不越界
        model = self.productModel.section[value];
        return model;
    }
    return  model;
    
}





//------------------下面是一些数据源方法------------------------

-(NSArray *)getDataArray:(NSString *)DataType{
    
    
    NSMutableArray *array = @[].mutableCopy;
    for (int i =0 ; i<self.Model.section.count; i++) {
        sectionModel *section = self.Model.section[i];
        if ([section.t_template  isEqualToString:DataType]) {
            array = [array arrayByAddingObjectsFromArray:section.items];
        }
        

    }
    return  array;
}



@end
