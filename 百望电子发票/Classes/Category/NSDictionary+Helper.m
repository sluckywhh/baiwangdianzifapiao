//
//  NSDictionary+Helper.m
//  tradeshiftHome
//
//  Created by Chuan Li on 7/4/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (NSDictionary *)dictForKey:(NSString *)key defaultValue:(NSDictionary *)dict{
    if ([[self allKeys] containsObject:key]) {
        if ([[self objectForKey:key] isKindOfClass:[NSDictionary class]]) {
            return [self objectForKey:key];
        }
    }
    return dict;
}

- (NSArray *)arrayForKey:(NSString *)key defaultValue:(NSArray *)array{
    if ([[self allKeys] containsObject:key]) {
        if ([[self objectForKey:key] isKindOfClass:[NSArray class]]) {
            return [self objectForKey:key];
        }
    }
    return array;
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)string{
    if ([[self allKeys] containsObject:key]) {
        if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
            return [self objectForKey:key];
        }
    }
    return string;
}

- (NSString *)queryString{
    NSMutableArray* queryArray = [NSMutableArray array];
    for (NSString* key in [self allKeys]){
        NSString* value = [self objectForKey:key];
        [queryArray addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    return [queryArray componentsJoinedByString:@"&"];
}

@end
