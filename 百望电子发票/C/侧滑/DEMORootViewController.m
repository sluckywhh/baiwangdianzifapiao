//
//  DEMOViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMORootViewController.h"
#import "BWSettingViewController.h"

@interface DEMORootViewController ()

@end

@implementation DEMORootViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ontroller"];

    
    BWSettingViewController *settingVC = [[UIStoryboard storyboardWithName:@"BWSettingViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"BWSettingViewController"];
    
    self.menuViewController =settingVC;

    
  

}

@end
