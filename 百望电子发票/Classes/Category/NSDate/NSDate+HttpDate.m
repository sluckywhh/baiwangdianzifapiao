//
//  NSDate+HttpDate.m
//  tradeshiftHome
//
//  Created by taq on 7/8/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "NSDate+HttpDate.h"

@implementation NSDate (HttpDate)

static NSDateFormatter* CreateDateFormatter(NSString *format)
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateFormatter setDateFormat:format];
    return dateFormatter;
}

+ (NSDate *)dateFromRFC3339DateString:(NSString *)httpDate
{
    static NSDateFormatter *RFC3399DateFormatter;
    NSDate *date = nil;
    
    @synchronized(self) // NSDateFormatter isn't thread safe
    {
        // RFC 3339 date format - 2014-07-07T17:08:39.613+08:00
        if (!RFC3399DateFormatter) RFC3399DateFormatter = CreateDateFormatter(@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ");
        return [RFC3399DateFormatter dateFromString:httpDate];
    }
    
    return date;
}

+ (NSDate *)GMTNow
{
    NSDate * now = [NSDate date];
    NSInteger gmtOffset = [[NSTimeZone localTimeZone] secondsFromGMT];
    return [NSDate dateWithTimeInterval:gmtOffset sinceDate:now];
}

+ (NSDate *)date:(NSString *)str withFormat:(DateDisplayFormat)format{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    if (format == YearMonthType) {
        formatter.dateFormat = @"yyyy-MM";
        return [formatter dateFromString:str];
    }
    else if (format == YearType){
        formatter.dateFormat = @"yyyy";
        return [formatter dateFromString:str];
    }
    return nil;
}

- (NSString*)display:(DateDisplayFormat)format{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    if (format == YearMonthType) {
        formatter.dateFormat = @"yyyy-MM";
        return [formatter stringFromDate:self];
    }
    else if (format == YearType){
        formatter.dateFormat = @"yyyy";
        return [formatter stringFromDate:self];
    }
    return nil;
}

@end
