//
//  NSObject+BindValue.m
//  tradeshiftHome
//
//  Created by taq on 1/28/15.
//  Copyright (c) 2015 Tradeshift. All rights reserved.
//

#import "NSObject+BindValue.h"
#include <objc/runtime.h>

static const char *BindValueKey = "V57W33BB-5F21-4192-B9I9-AHJE83D8VC32";

@implementation NSObject (BindValue)

- (void) bindValue:(id)val
{
    objc_setAssociatedObject(self, &BindValueKey, val, OBJC_ASSOCIATION_RETAIN);
}

- (id) fetchValue
{
    return objc_getAssociatedObject(self, &BindValueKey);
}

- (id)valueForXPath:(NSString*)fullPath{
    NSArray* parts = [fullPath componentsSeparatedByString:@"."];
    id currentObj = self;
    for (NSString* part in parts){
        NSRange range1 = [part rangeOfString:@"["];
        NSRange range2 = [part rangeOfString:@"]"];
        if (range1.location == NSNotFound){
            currentObj = [currentObj valueForKey:part];
        }
        else{
            NSString* arrayKey = [part substringToIndex:range1.location];
            NSArray* currentArray = [currentObj valueForKey:arrayKey];
            
            NSString* param = [part substringWithRange:NSMakeRange(range1.location+1, range2.location-range1.location-1)];
            param = [param stringByReplacingOccurrencesOfString:@"#" withString:@"."];
            if ([param hasPrefix:@"@"]) {
                
                NSArray* kvc = [[param substringFromIndex:1] componentsSeparatedByString:@"="];
                NSString* key = [kvc objectAtIndex:0];
                id returnObj = nil;
                for (NSObject* obj in currentArray){
                    id value = [obj valueForXPath:key];
                    if (value) {
                        if ([kvc count] <= 1) {
                            returnObj = obj;
                            break;
                        }
                        else if ([value isEqual:[kvc objectAtIndex:1]]) {
                            returnObj = obj;
                            break;
                        }
                    }
                }
                currentObj = returnObj;
            }
            else{
                int index = [param intValue];
                currentObj = [[currentObj valueForKey:arrayKey] objectAtIndex:index];
            }
        }
        if (nil == currentObj) {
            return nil;
        }
    }
    return currentObj;
}

@end
