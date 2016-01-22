//
//  BWdescriptionViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/20.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWdescriptionViewController : UIViewController
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
