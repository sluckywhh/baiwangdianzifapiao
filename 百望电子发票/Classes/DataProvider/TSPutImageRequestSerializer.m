//
//  TSPutImageRequestSerializer.m
//  tradeshiftHome
//
//  Created by Chuan Li on 9/4/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "TSPutImageRequestSerializer.h"

@implementation TSPutImageRequestSerializer

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error
{
    NSParameterAssert(request);
    NSAssert([parameters isKindOfClass:[NSData class]], @"Parameters should be of type NSData");
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    
    [self.HTTPRequestHeaders enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![request valueForHTTPHeaderField:field]) {
            [mutableRequest setValue:value forHTTPHeaderField:field];
        }
    }];
    
    [mutableRequest setHTTPBody:parameters];
    
    return mutableRequest;
}

@end
