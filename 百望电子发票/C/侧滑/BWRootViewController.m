//
//  BWRootViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/20.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWRootViewController.h"

@interface BWRootViewController ()

@end

@implementation BWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BWHomeViewController"];
//    self.menuViewController = [self.storyboard 
    self.contentViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BWHomeViewController"];
    self.menuViewController = [[UIStoryboard storyboardWithName:@"BWSettingViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"BWSettingViewController"];
}



@end
