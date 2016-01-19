//
//  NSArray+Sort.m
//  tradeshiftHome
//
//  Created by taq on 9/25/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "NSArray+Sort.h"


@implementation NSArray (Sort)

- (NSArray *)reversedArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

@end
