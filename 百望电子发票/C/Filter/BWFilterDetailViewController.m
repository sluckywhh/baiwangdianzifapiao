//
//  BWFilterDetailViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/22.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWFilterDetailViewController.h"
#import "filterDetailTableViewCell.h"

@interface BWFilterDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSDictionary* mapDict;
@property (nonatomic, strong) NSDictionary* filterSetDict;
@property (nonatomic, strong) NSMutableDictionary* dateDict;
@end

@implementation BWFilterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tableViewHide:)];
    [self.topView addGestureRecognizer:tap];
    
    self.mapDict = @{@"invoiceType":@"交易类型", @"buyerPhone":@"手机号", @"status":@"发票状态", @"location":@"交易地点", @"invoiceDate":@"发票日期"};
    self.filterSetDict = @{@"invoiceType":[NSMutableSet set],
                           @"buyerPhone":[NSMutableSet set],
                           @"status":[NSMutableSet set],
                           @"location":[NSMutableSet set],
                           @"invoiceDate":[NSMutableSet set]};
    self.dateDict = [NSMutableDictionary dictionary];
    
}

- (void)tableViewHide:(UITapGestureRecognizer *)tap{
    
    [self hideTableView];
    
}

- (void)hideTableView {
    [self.delegate dismissFilter:self];
}


- (IBAction)cancelAction:(id)sender {
    [self hideTableView];
}

- (IBAction)clearAction:(id)sender {
    
    for (NSMutableSet *set in [self.filterSetDict allValues]){
        [set removeAllObjects];
    }
    
    [self.dateDict removeAllObjects];
    [self.delegate removeAllFilterInFilterVC:self];
    [self hideTableView];

}

- (IBAction)saveAction:(id)sender {
    [self.delegate filterVC:self didSelectFilter:self.filterSetDict dateDict:self.dateDict];
    
    [self hideTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.mapDict count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    filterDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:0.5];
    cell.titleLable.font = [UIFont systemFontOfSize:14];
    cell.titleLable.text = [[self.mapDict allValues] objectAtIndex:indexPath.row];
    UIView *view = [[UIView alloc]initWithFrame:cell.frame];
    [view setBackgroundColor:[UIColor whiteColor]];
    cell.selectedBackgroundView =view;
    
    [cell setNeedsUpdateConstraints];//更新约束布局，ios6
    [cell updateConstraintsIfNeeded];//更新约束布局，ios6
    [cell setNeedsLayout]; //在下次更新中刷新布局
    [cell layoutIfNeeded];//立即刷新布局
    return cell;
}



@end
