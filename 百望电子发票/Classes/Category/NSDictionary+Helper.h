//
//  NSDictionary+Helper.h
//  tradeshiftHome
//
//  Created by Chuan Li on 7/4/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

- (NSDictionary *)dictForKey:(NSString *)key defaultValue:(NSDictionary *)dict;
- (NSArray *)arrayForKey:(NSString *)key defaultValue:(NSArray *)array;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)string;

- (NSString *)queryString;
@end
