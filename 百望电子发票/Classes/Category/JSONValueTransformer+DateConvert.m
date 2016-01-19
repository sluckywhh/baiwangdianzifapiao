//
//  JSONValueTransformer+DateConvert.m
//  tradeshiftHome
//
//  Created by Chuan Li on 5/8/15.
//  Copyright (c) 2015 Tradeshift. All rights reserved.
//

#import "JSONValueTransformer+DateConvert.h"

#define APIDateFormat @"yyyy-MM-dd'T'HH:mm:ss.AAAZ"

@implementation JSONValueTransformer (DateConvert)

- (NSDate *)NSDateFromNSString:(NSString*)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:APIDateFormat];
    return [formatter dateFromString:string];
}

- (NSString *)JSONObjectFromNSDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:APIDateFormat];
    return [formatter stringFromDate:date];
}

@end
