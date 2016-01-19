//
//  NSNumber+Helper.m
//  MonkeyKing
//
//  Created by Chuan Li on 9/8/15.
//  Copyright (c) 2015 Chuan Li. All rights reserved.
//

#import "NSNumber+Helper.h"

@implementation NSNumber (Helper)

- (NSString *)localExpresion:(NSString *)format{
    return [NSString localizedStringWithFormat:format, [self doubleValue]];
}

@end
