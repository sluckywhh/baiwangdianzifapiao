//
//  BWSearchViewController.h
//  百望电子发票
//
//  Created by baiwang on 16/1/19.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "GViewController.h"

@interface BWSearchViewController : GViewController

@property (weak, nonatomic) IBOutlet UITextField *codeFiled;
@property (weak, nonatomic) IBOutlet UITextField *numberFiled;
@property (weak, nonatomic) IBOutlet UITextField *dateFiled;
@property (weak, nonatomic) IBOutlet UITextField *moneyFiled;
@property (weak, nonatomic) IBOutlet UITextField *verifyFiled;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

- (IBAction)searchAction:(id)sender;

@end
