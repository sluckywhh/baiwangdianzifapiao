//
//  BWSettingViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/19.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWSettingViewController.h"
#import "numberPhoneTableViewCell.h"
#import "settingTableViewCell.h"
#import "pushTableViewCell.h"
#import "BWdescriptionViewController.h"
#import "BWAccountSettingViewController.h"

@interface BWSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BWSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    self.tableView.backgroundColor =[UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    
    self.navigationItem.title = @"设置";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoutButton addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont systemFontOfSize:17];
    logoutButton.frame = CGRectMake(-25, 20,self.view.width+3.f,40);
    logoutButton.backgroundColor = [UIColor whiteColor];
    [logoutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.width+3.f, 60.f)];
    [self.tableView.tableFooterView addSubview:logoutButton];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return 44.0;
    }else{
        return 0.0000001f;
    }
    return 0.0000001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if(section == 0){
        return 20.0;
    }else{
        return 0.0000001f;
    }
    return 0.0000001f;
}

-(UIView *)tableView:(UITableView *)tableview viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView =[[UIView alloc]initWithFrame: CGRectZero];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
            pushTableViewCell *pushCell = [tableView dequeueReusableCellWithIdentifier:@"pushCell"];
            pushCell.pushLable.text = @"1232435435";
            pushCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = pushCell;
            break;
            
        }
        case 1:
        {
            settingTableViewCell *settinhCell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
            settinhCell.settingLable.text = @"消息推送";
            settinhCell.settingSwitch.selected = YES;
            cell = settinhCell;
            break;
        }
        case 2:
        {
            pushTableViewCell *pushCell = [tableView dequeueReusableCellWithIdentifier:@"pushCell"];
            pushCell.pushLable.text = @"软件介绍";
            pushCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = pushCell;
            break;
        }
        case 3:
        {
            numberPhoneTableViewCell *numberCell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
            
            
            cell = numberCell;
            break;
            
        }
        default:
            break;
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.section){
        BWAccountSettingViewController * vc = STORYBOARD(@"BWAccountSettingViewController");
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    if (2 == indexPath.section) {
        BWdescriptionViewController * vc = STORYBOARD(@"BWdescriptionViewController");
       [self presentViewController:vc animated:YES completion:nil];
        
    }
}


-(void)logout:(id)sender{

}

@end
