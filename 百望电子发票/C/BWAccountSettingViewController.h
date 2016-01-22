//
//  BWAccountSettingViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BWSegmentControl;

@interface BWAccountSettingViewController : UIViewController

- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet BWSegmentControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIView *hostView;

@end
