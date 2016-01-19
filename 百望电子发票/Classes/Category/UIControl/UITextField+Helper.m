//
//  UITextField+Helper.m
//  tradeshiftHome
//
//  Created by Chuan Li on 8/11/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UITextField+Helper.h"
#import "CommonDefine.h"
#import "UIView+Common.h"

@implementation UITextField (Helper)

- (void)applyFieldStyle:(TSTextFieldStyle)fieldStyle{
    switch (fieldStyle) {
        case TSTextFieldStyle1:
        {
            self.backgroundColor = HIGHLIGHT_LIGHT;
            self.font = FONT_M;
            self.textColor = WHITE;
            if (self.placeholder) {
                self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: HIGHLIGHT_NORMAL, NSFontAttributeName:FONT_M}];
            }
            break;
        }
        case TSTextFieldStyle2:
        {
            self.backgroundColor = [UIColor whiteColor];
            self.font = FONT_XL;
            self.textColor = GREY_DARK;
            if (self.placeholder) {
                self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: GREY_LIGHT, NSFontAttributeName:FONT_M}];
            }
            break;
        }
        case TSTextFieldStyle3:
        {
            self.backgroundColor = [UIColor whiteColor];
            self.font = FONT_M;
            self.textColor = GREY_DARK;
            if (self.placeholder) {
                self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: GREY_LIGHT, NSFontAttributeName:FONT_M}];
            }
            break;
        }
        default:
            break;
    }
}

@end
