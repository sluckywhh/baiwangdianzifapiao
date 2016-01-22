//
//  BWPhoneBindViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "GViewController.h"

@interface BWPhoneBindViewController : GViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak ,nonatomic)UITextField * phoneText;
@property(weak ,nonatomic)UITextField * verifyText;
@property(weak ,nonatomic)UIButton * addBtn;
@property(weak ,nonatomic)UIButton * sendSMS;
@end
