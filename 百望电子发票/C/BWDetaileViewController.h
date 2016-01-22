//
//  BWDetaileViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/19.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "GViewController.h"

@interface BWDetaileViewController : GViewController

- (IBAction)saveImageAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIView *daohanglan;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;


@end
