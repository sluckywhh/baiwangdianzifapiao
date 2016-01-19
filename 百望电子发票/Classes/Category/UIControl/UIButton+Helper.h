//
//  UIButton+Helper.h
//  tradeshiftHome
//
//  Created by Chuan Li on 8/11/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    TSButtonStyle1,
    TSButtonStyle2,
    TSButtonStyle3,
    TSButtonStyle4,
    TSButtonStyle5,
    TSButtonStyle6,
    TSButtonStyle7
}TSButtonStyle;

@interface UIButton (Helper)

- (void)applyButtonStyle:(TSButtonStyle)buttonStyle;

@end
