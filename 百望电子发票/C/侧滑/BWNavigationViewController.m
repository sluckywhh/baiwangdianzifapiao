//
//  BWNavigationViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/20.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWNavigationViewController.h"
#import "REFrostedViewController.h"

@interface BWNavigationViewController ()

@end

@implementation BWNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.frostedViewController panGestureRecognized:sender];
}
@end
