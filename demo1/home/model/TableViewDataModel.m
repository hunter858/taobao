//
//  TableViewDataModel.m
//  TailTravel
//
//  Created by pengchao on 16/7/19.
//  Copyright © 2016年 pengchao. All rights reserved.
//

#import "TableViewDataModel.h"

@implementation CellModel



@end

@implementation TableViewSectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.cellModelsArr=@[].mutableCopy;
        
    }
    return self;
}

@end

@interface TableViewDataModel ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation TableViewDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.tableViewDataArr=@[].mutableCopy;
        
    }
    return self;
}

-(void)targetTableView:(UITableView*)tableview{
    _tableView=tableview;
    _tableView.delegate=self;
    _tableView.dataSource=self;
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.tableViewDataArr.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[section];
        return sectionModel.cellModelsArr.count;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[section];
        
        if (sectionModel.viewForHeaderInSection==NULL) {
            return 0;
        }
        if (sectionModel.heightForHeaderInSection!=NULL) {
            return sectionModel.heightForHeaderInSection(tableView,section);
        }
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[section];
        
        if (sectionModel.viewForHeaderInSection!=NULL) {
            return sectionModel.viewForHeaderInSection(tableView,section);
        }
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height=0;
    
    if (indexPath.section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[indexPath.section];
        
        if (indexPath.row<sectionModel.cellModelsArr.count) {
            CellModel *cellmodel=sectionModel.cellModelsArr[indexPath.row];
            
            if (cellmodel.CellHeight!=NULL) {
                height=cellmodel.CellHeight(tableView,indexPath);
            }
        }
    }
    
    
    
    return height;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[indexPath.section];
        
        if (indexPath.row<sectionModel.cellModelsArr.count) {
            CellModel *cellmodel=sectionModel.cellModelsArr[indexPath.row];
            UITableViewCell *modelcell=nil;
            
            if (cellmodel.Cell!=NULL) {
                modelcell=cellmodel.Cell(tableView,indexPath);
                if (modelcell!=nil) {
                    return modelcell;
                }
            }
        }
    }
    
    static NSString *identifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section<self.tableViewDataArr.count) {
        TableViewSectionModel *sectionModel=self.tableViewDataArr[indexPath.section];
        
        if (indexPath.row<sectionModel.cellModelsArr.count) {
            CellModel *cellmodel=sectionModel.cellModelsArr[indexPath.row];
            if (cellmodel.SelectRow!=NULL) {
                cellmodel.SelectRow(tableView,indexPath);
            }
        }
    }
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{
    
    if (self.sectionIndexTitlesForTableView!=NULL) {
        return self.sectionIndexTitlesForTableView(tableView);
    }
    
    return nil;
    
}

//索引列点击事件

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index

{
    if(self.sectionForSectionIndexTitle!=NULL){
        return self.sectionForSectionIndexTitle(tableView,title,index);
    }
    return 0;
    
}

@end
