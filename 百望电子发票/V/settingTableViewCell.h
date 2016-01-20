//
//  settingTableViewCell.h
//  百望电子发票
//
//  Created by baiwang on 16/1/20.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *settingLable;
@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;
- (IBAction)switchAction:(id)sender;



@end
