//
//  UIButton+Helper.m
//  tradeshiftHome
//
//  Created by Chuan Li on 8/11/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UIButton+Helper.h"
#import "UIImage+Helper.h"
#import "CommonDefine.h"
#import "TSToolUtil.h"
#import "UIView+Common.h"

@implementation UIButton (Helper)

- (void)applyButtonStyle:(TSButtonStyle)buttonStyle{
    switch (buttonStyle) {
        case TSButtonStyle1:
        {
            [self setTitleColor:HIGHLIGHT_NORMAL forState:UIControlStateNormal];
            self.layer.borderColor = HIGHLIGHT_NORMAL.CGColor;
            self.layer.borderWidth = 1;
            self.layer.cornerRadius = self.frame.size.height/2.0;
            self.backgroundColor = [UIColor whiteColor];
            [self.titleLabel setFont:FONT_S];
            break;
        }
        case TSButtonStyle2:
        {
            self.backgroundColor = HIGHLIGHT_NORMAL;
            self.layer.cornerRadius = self.frame.size.height/2.0;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.titleLabel setFont:FONT_S];
            break;
        }
        case TSButtonStyle3:    //style3 used in signin for now
        {
            [self setBackgroundImage:[UIImage imageWithColor:WHITE] forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageWithColor:WHITE] forState:UIControlStateDisabled];
            [self setTitleColor:HIGHLIGHT_NORMAL forState:UIControlStateNormal];
            [self setTitleColor:GREY_LIGHT forState:UIControlStateDisabled];
            self.layer.cornerRadius = 4.0f;
            self.clipsToBounds = YES;
            break;
        }
        case TSButtonStyle4:    //style4
        {
            [self setTitleColor:HIGHLIGHT_NORMAL forState:UIControlStateNormal];
            [self setTitleColor:WHITE forState:UIControlStateHighlighted];
            self.layer.borderColor = [HIGHLIGHT_NORMAL CGColor];
            self.layer.borderWidth = 1.0;
            self.adjustsImageWhenHighlighted = NO;
            [self setBackgroundImage:[UIImage imageWithColor:HIGHLIGHT_NORMAL] forState:UIControlStateHighlighted];
            self.height = 24.f;
            self.titleLabel.font = FONT_S;
            self.layer.cornerRadius = 4.0f;
            self.clipsToBounds = YES;
            break;
        }
        case TSButtonStyle5:    //style5 grey version of style 4
        {
            self.layer.borderColor = [GREY_LIGHT CGColor];
            self.layer.borderWidth = 1.0;
            self.adjustsImageWhenHighlighted = NO;
            [self setBackgroundImage:[UIImage imageWithColor:GREY_LIGHT] forState:UIControlStateHighlighted];
            self.height = 24.f;
            self.titleLabel.font = FONT_S;
            self.layer.cornerRadius = 4.0f;
            [self setTitleColor:GREY_LIGHT forState:UIControlStateNormal];
            [self setTitleColor:WHITE forState:UIControlStateHighlighted];
            self.clipsToBounds = YES;
            break;
        }
        case TSButtonStyle6:    //style3 used in signin for now
        {
            [self setTitleColor:GREY_DARK forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageWithColor:WHITE] forState:UIControlStateNormal];
            [self setTitleColor:WHITE forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageWithColor:HIGHLIGHT_LIGHT] forState:UIControlStateHighlighted];
            self.width = 120.f;
            self.height = 42.f;
            self.titleLabel.font = FONT_L;
            self.layer.cornerRadius = 4.0f;
            self.clipsToBounds = YES;
            break;
        }
        case TSButtonStyle7:    //style3 used in signin for now
        {
            [self setTitleColor:WHITE forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageWithColor:HIGHLIGHT_LIGHT] forState:UIControlStateNormal];
            [self setTitleColor:GREY_DARK forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageWithColor:WHITE] forState:UIControlStateHighlighted];
            self.width = 120.f;
            self.height = 42.f;
            self.titleLabel.font = FONT_L;
            self.layer.cornerRadius = 4.0f;
            self.clipsToBounds = YES;
            break;
        }
        default:
            break;
    }
}

@end
