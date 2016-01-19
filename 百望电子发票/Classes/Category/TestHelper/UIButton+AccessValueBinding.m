//
//  UIButton+AccessValueBinding.m
//  tradeshiftHome
//
//  Created by taq on 7/29/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UIButton+AccessValueBinding.h"

@implementation UIButton (AccessValueBinding)

#if UITEST
- (NSString *)accessibilityValue
{
    return [self titleForState:self.state];
}
#endif

@end
