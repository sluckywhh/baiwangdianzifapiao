//
//  UILable+Helper.m
//  tradeshiftHome
//
//  Created by Fish Yu on 9/25/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UILabel+Helper.h"
#import "UIImage+Helper.h"
#import "CommonDefine.h"
#import "TSToolUtil.h"
#import "UIView+Common.h"
#import "NSString+Helper.h"

@implementation UILabel (Helper)

- (void)applyLabelStyle:(TSTagLabelStyle)style{
    NSString * text = self.text;
    self.font = FONT_S;
    float width =  [text sizeWithAttributes:@{NSFontAttributeName:self.font}].width + 24;
    width = width> 100 ? 100 : width;
    __block UILabel* theLabel = self;
    [self.constraints enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLayoutConstraint * c = obj;
        if (c.firstItem == theLabel && c.secondItem == nil) {
            c.constant = width;
            *stop = YES;
        }
    }];
    switch (style) {
        case TSTagLabelStyleNormal:
        {
            self.backgroundColor = GREY_LIGHT;
            break;
        }
        case TSTagLabelStyleSelected:    //style3 used in signin for now
        {
            self.backgroundColor = HIGHLIGHT_NORMAL;
            break;
        }
        default:
            break;
    }
}

- (void)resizeToMultiline{
    self.numberOfLines = 0;
    self.height = [self.text sizeWithFont:self.font andWidth:self.width].height;
}

@end
