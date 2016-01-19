//
//  NSDate+HttpDate.h
//  tradeshiftHome
//
//  Created by taq on 7/8/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    YearMonthType,
    YearType
} DateDisplayFormat;

@interface NSDate (HttpDate)

+ (NSDate *)dateFromRFC3339DateString:(NSString *)httpDate;
+ (NSDate *)date:(NSString *)str withFormat:(DateDisplayFormat)format;
- (NSString*)display:(DateDisplayFormat)format;

@end
