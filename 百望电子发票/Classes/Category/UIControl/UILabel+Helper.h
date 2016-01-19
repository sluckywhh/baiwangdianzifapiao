//
//  UILable+Helper.m
//  tradeshiftHome
//
//  Created by Fish Yu on 9/25/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    TSTagLabelStyleNormal,
    TSTagLabelStyleSelected
}TSTagLabelStyle;

@interface UILabel (Helper)

- (void)applyLabelStyle:(TSTagLabelStyle)style;
- (void)resizeToMultiline;

@end
