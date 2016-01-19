//
//  AppearenceUtil.m
//  TripMan
//
//  Created by taq on 8/11/15.
//  Copyright (c) 2015 Location. All rights reserved.
//

#import "AppearenceUtil.h"
#import "TAlertView.h"
#import "CommonDefine.h"

@implementation AppearenceUtil

+ (void) applyTAlertView
{
    TAlertView *appearance = [TAlertView appearance];
    appearance.alertBackgroundColor     = HIGHLIGHT_NORMAL;
    //appearance.alertBackgroundColor     = [[UIColor blackColor] colorWithAlphaComponent:0.7];
  
    //appearance.titleFont                = [UIFont fontWithName:@"Cochin" size:22];
    appearance.titleFont                = [UIFont fontWithName:@"Helvetica" size:22];
    appearance.messageColor             = [UIColor whiteColor];
   // appearance.messageFont              = [UIFont fontWithName:@"Cochin" size:14];
     appearance.messageFont              = [UIFont fontWithName:@"Helvetica" size:14];
    appearance.buttonsTextColor         = [UIColor whiteColor];
   // appearance.buttonsFont              = [UIFont fontWithName:@"Cochin-Bold" size:16];
    appearance.buttonsFont              = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    appearance.separatorsLinesColor     = [UIColor grayColor];
    //appearance.tapToCloseFont           = [UIFont fontWithName:@"Cochin" size:10];
    appearance.tapToCloseFont           = [UIFont fontWithName:@"Helvetica" size:10];
    appearance.tapToCloseColor          = [UIColor grayColor];
    appearance.tapToCloseText           = @"Tap To Close";
    [appearance setTitleColor:[UIColor orangeColor] forAlertViewStyle:TAlertViewStyleError];
    [appearance setDefaultTitle:@"Error" forAlertViewStyle:TAlertViewStyleError];
    [appearance setTitleColor:[UIColor whiteColor] forAlertViewStyle:TAlertViewStyleNeutral];
}

@end
