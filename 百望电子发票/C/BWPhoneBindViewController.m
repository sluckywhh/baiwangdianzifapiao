//
//  BWPhoneBindViewController.m
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWPhoneBindViewController.h"
#import "phoneBindTableViewCell.h"
#import "UIImage+Helper.h"


@interface BWPhoneBindViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BWPhoneBindViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,80, self.view.width+4.f, 300)];
    
    UIView* subView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.width+4.f, 40.f)];
    subView.backgroundColor = [UIColor colorWithRed:207.0/255 green:207.0/255 blue:207.0/255 alpha:1];
    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(20,0, 75.f, 40.f)];
    title.font = [UIFont systemFontOfSize:15.f];
    title.text = @"绑定手机";
    [title setTextColor:[UIColor blackColor]];
    [subView addSubview:title];
    
    UIButton* clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width- 30, 150, 24, 24)];
    [clearBtn setBackgroundImage:[UIImage imageNamed:@"icon_cleanbox_normal"] forState:UIControlStateNormal];
    [clearBtn setBackgroundImage:[UIImage imageNamed:@"icon_cleanbox_active"] forState:UIControlStateHighlighted];
    [clearBtn addTarget:self action:@selector(_clearPhoneNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *phoneText =[[UITextField alloc]initWithFrame:CGRectMake(5, subView.bottom+1.f, self.view.width-2, 44)];
    phoneText.backgroundColor = [UIColor whiteColor];
    phoneText.font = FONT_L;
    phoneText.rightView = clearBtn;
    phoneText.rightViewMode = UITextFieldViewModeWhileEditing;
    phoneText.textColor = UIColorFromRGB(0x3e444c);
    phoneText.placeholder = @"手机号";
    phoneText.accessibilityIdentifier = @"PhoneNumber";
    phoneText.backgroundColor = [UIColor whiteColor];
    phoneText.keyboardType = UIKeyboardTypePhonePad;
    phoneText.textColor = GREY_DARK;
    phoneText.font = FONT_M;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17, 40)];
    phoneText.leftView = paddingView;
    phoneText.leftViewMode = UITextFieldViewModeAlways;
    
    [phoneText addTarget:self action:@selector(_numberChanged:) forControlEvents:UIControlEventEditingChanged];
    self.phoneText = phoneText;
    
    UIButton* clearVerify = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width-30, 150, 24, 24)];
    [clearVerify setBackgroundImage:[UIImage imageNamed:@"icon_cleanbox_normal"] forState:UIControlStateNormal];
    [clearVerify setBackgroundImage:[UIImage imageNamed:@"icon_cleanbox_active"] forState:UIControlStateHighlighted];
    [clearVerify addTarget:self action:@selector(_clearVerifyNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *verifyText =[[UITextField alloc]initWithFrame:CGRectMake(5, phoneText.bottom + 1.f, self.view.width-2, 44)];
    verifyText.backgroundColor = [UIColor whiteColor];
    verifyText.textColor = UIColorFromRGB(0x3e444c);
    verifyText.placeholder = @"验证码";
    verifyText.accessibilityIdentifier = @"VerifyCode";
    verifyText.backgroundColor = [UIColor whiteColor];
    verifyText.keyboardType = UIKeyboardTypeNumberPad;
    verifyText.textColor = GREY_DARK;
    verifyText.font = FONT_M;
    verifyText.rightView = clearVerify;
    verifyText.rightViewMode = UITextFieldViewModeWhileEditing;
    UIView *padding = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17, 40)];
    verifyText.leftView = padding;
    verifyText.leftViewMode = UITextFieldViewModeAlways;
    self.verifyText = verifyText;
    
    UIButton * sendSMS =[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-81,  phoneText.bottom + 2.f, 80, 41)];
    [sendSMS setTitleColor:WHITE forState:UIControlStateNormal];
    [sendSMS setBackgroundImage:[UIImage imageWithColor:HIGHLIGHT_LIGHT] forState:UIControlStateNormal];
    [sendSMS setTitleColor:GREY_DARK forState:UIControlStateHighlighted];
    [sendSMS setBackgroundImage:[UIImage imageWithColor:WHITE] forState:UIControlStateHighlighted];
    [sendSMS addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    sendSMS.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [sendSMS setTitle:@"发送验证码" forState:UIControlStateNormal];
    sendSMS.layer.cornerRadius = 4.0f;
    sendSMS .clipsToBounds = YES;
    self.sendSMS = sendSMS;
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(addPhone) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    addBtn.frame = CGRectMake(10,verifyText.bottom+30.f,self.view.width-13,40);
    addBtn.titleLabel.textColor =[UIColor whiteColor];
    [addBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:207.0/255 green:207.0/255 blue:207.0/255 alpha:0.5]] forState:UIControlStateDisabled];
    [addBtn setBackgroundImage:[[UIImage imageNamed:@"btn_style1_normal"] stretchableImageWithLeftCapWidth:10 topCapHeight:10] forState:UIControlStateNormal];
    addBtn.layer.cornerRadius = 4.0f;
    addBtn.clipsToBounds = YES;
    addBtn.enabled = NO;
    self.addBtn = addBtn;
    
    [view addSubview:subView];
    [view addSubview:phoneText];
    [view addSubview:verifyText];
    [view addSubview:sendSMS];
    [view addSubview:addBtn];
    self.tableView.tableFooterView =view;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    phoneBindTableViewCell *cell = (phoneBindTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" ];
    
    cell.titleLable.textColor = [UIColor blackColor];
    cell.titleLable.font = [UIFont systemFontOfSize:14.f];
    cell.titleLable.text = @"您还没有绑定手机";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   return  40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, 60)];
    headerView.backgroundColor = [UIColor colorWithRed:207.0/255 green:207.0/255 blue:207.0/255 alpha:1];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 75, 40)];
    title.text = @"已绑定";
    title.font = [UIFont systemFontOfSize:15];
    [title setTextColor:[UIColor blackColor]];
    [headerView addSubview:title];
    return headerView;
    
}

- (void)addPhone{

}

- (void)sendCode:(id)sender{

}

- (void)_clearPhoneNumber:(id)sender{
    self.phoneText.text = nil;
}
- (void)_clearVerifyNumber:(UITextField *)verifyField{
    self.verifyText.text = nil;
}

-(void)_numberChanged:(UITextField *)phoneField{
    self.addBtn.enabled = [self.phoneText.text length] == 11;
}


@end
