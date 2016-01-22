//
//  BWHomeViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/19.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWHomeViewController.h"
#import "BWDetaileViewController.h"
#import "BWSearchViewController.h"
#import "BWSettingViewController.h"
#import "REFrostedViewController.h"


@interface BWHomeViewController ()

@property (strong, nonatomic) UIButton *settingBtn;
@end

@implementation BWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发票列表";
    self.barUIView.backgroundColor = barViewBackage;

    [self _alignBtn:self.shaixuan];
    [self _alignBtn:self.shijian];
    [self _alignBtn:self.jinqian];
    [self _alignBtn:self.gengduopaixu];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 36, 36);
    leftBtn.layer.cornerRadius = leftBtn.width/2.0f;
    leftBtn.clipsToBounds = YES;
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon_companylogo"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *settingBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = settingBtn;
    self.settingBtn = leftBtn;
    
    
}

- (void)settingAction:(UIButton*)sender{
   
//    BWSettingViewController *settingVC = STORYBOARD(@"BWSettingViewController");
//    [self.navigationController pushViewController:settingVC animated:YES];
    
    
    [self.frostedViewController presentMenuViewController];
    

}

- (IBAction)findAction:(UIButton*)sender {
    BWSearchViewController *searchVC = STORYBOARD(@"BWSearchViewController");
    [self.navigationController pushViewController:searchVC animated:YES];

}


- (IBAction)shaixuanAction:(UIButton*)sender {
    sender.selected = YES;
    self.jinqian.selected = NO;
    self.shijian.selected = NO;
    self.gengduopaixu.selected = NO;
    
}

- (IBAction)jinqianAction:(UIButton*)sender {
    sender.selected = YES;
    self.shijian.selected = NO;
    self.gengduopaixu.selected = NO;
    self.shaixuan.selected = NO;
}

- (IBAction)shijianAction:(UIButton*)sender {
    sender.selected = YES;
    self.jinqian.selected = NO;
    self.gengduopaixu.selected = NO;
    self.shaixuan.selected = NO;
}

- (IBAction)paixuAction:(UIButton*)sender {
    sender.selected = YES;
    self.jinqian.selected = NO;
    self.shijian.selected = NO;
    self.shaixuan.selected = NO;
}

- (void)_alignBtn:(UIButton *)btn{
    float spacing = 0.0;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, - btn.imageView.width, -(btn.imageView.height + spacing), 0.0);
    CGSize titleSize =  btn.titleLabel.frame.size;
    btn.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}


@end
