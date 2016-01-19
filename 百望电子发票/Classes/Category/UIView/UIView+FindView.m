//
//  UIView+FindView.m
//  tradeshiftHome
//
//  Created by taq on 10/28/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UIView+FindView.h"

@implementation UIView (FindView)

- (UIView*)superViewOfKind:(Class)cls
{
    UIView * supperView = self;
    while (supperView) {
        if ([supperView isKindOfClass:cls]) {
            return supperView;
        } else {
            supperView = [supperView superview];
        }
    }
    return nil;
}

@end
