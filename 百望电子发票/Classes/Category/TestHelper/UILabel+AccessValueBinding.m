//
//  UILabel+AccessValueBinding.m
//  tradeshiftHome
//
//  Created by taq on 7/29/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "UILabel+AccessValueBinding.h"

@implementation UILabel (AccessValueBinding)

#if UITEST
- (NSString *)accessibilityValue
{
    return self.text;
}
#endif

@end
