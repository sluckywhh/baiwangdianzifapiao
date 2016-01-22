//
//  BWAccountSettingViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWAccountSettingViewController.h"
#import "BWChangeMailTableViewController.h"
#import "BWChangePhoneTableViewController.h"
#import "BWPhoneBindViewController.h"
#import "BWSegmentControl.h"

@interface BWAccountSettingViewController ()<BWSegmentControlDelegate>

@property (nonatomic,strong) BWChangePhoneTableViewController *changePhoneVC;
@property (nonatomic,strong) BWChangeMailTableViewController *changeMailVC;
@property (nonatomic,strong) BWPhoneBindViewController *phoneBindVC;


@end

@implementation BWAccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _segmentControl.delegate = self;
    
    self.changePhoneVC = STORYBOARD(@"BWChangePhoneTableViewController");
    self.changePhoneVC.view.frame = self.hostView.bounds;
    self.changeMailVC = STORYBOARD(@"BWChangeMailTableViewController");
    self.changeMailVC.view.frame = self.hostView.bounds;
    self.phoneBindVC = STORYBOARD(@"BWPhoneBindViewController");
    self.phoneBindVC.view.frame = self.hostView.bounds;
    
    [self addChildViewController:_changePhoneVC];
    [self.hostView addSubview:self.changePhoneVC.view];
    [self addChildViewController:self.changeMailVC];
    [self.hostView addSubview:self.changeMailVC.view];
    [self addChildViewController:self.phoneBindVC];
    [self.hostView addSubview:self.phoneBindVC.view];
    
}

- (void)didSelectTab:(NSUInteger)tabIndex{

    if (tabIndex == 0) {
        [self.hostView bringSubviewToFront:self.changePhoneVC.view];
    } else if (tabIndex == 1){
        [self.hostView bringSubviewToFront:self.changeMailVC.view];
    } else {
        [self.hostView bringSubviewToFront:self.phoneBindVC.view];
    }
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
