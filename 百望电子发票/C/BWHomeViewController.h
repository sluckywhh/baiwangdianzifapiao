//
//  BWHomeViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/19.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "GViewController.h"

@interface BWHomeViewController : GViewController
- (IBAction)findAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (weak, nonatomic) IBOutlet UIView *barUIView;


- (IBAction)shaixuanAction:(id)sender;
- (IBAction)jinqianAction:(id)sender;
- (IBAction)shijianAction:(id)sender;
- (IBAction)paixuAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *shaixuan;
@property (weak, nonatomic) IBOutlet UIButton *jinqian;
@property (weak, nonatomic) IBOutlet UIButton *shijian;
@property (weak, nonatomic) IBOutlet UIButton *gengduopaixu;

@end
