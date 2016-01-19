//
//  UITextField+Helper.h
//  tradeshiftHome
//
//  Created by Chuan Li on 8/11/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    TSTextFieldStyle1,
    TSTextFieldStyle2,
    TSTextFieldStyle3
}TSTextFieldStyle;

@interface UITextField (Helper)

- (void)applyFieldStyle:(TSTextFieldStyle)fieldStyle;

@end
