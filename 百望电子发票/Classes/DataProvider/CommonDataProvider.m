//
//  CommonDataProvider.m
//  MonkeyKing
//
//  Created by taq on 8/18/15.
//  Copyright (c) 2015 Chuan Li. All rights reserved.
//

#import "CommonDataProvider.h"
#import "TSCache.h"
#import "Constant.h"

#define kBaseUrl        @"tsBaseUrlKey"

@interface CommonDataProvider ()

@property (nonatomic, strong) NSDictionary *        countryCodeDict;
@property (nonatomic, strong) NSString *            baseUrl;

@end

@implementation CommonDataProvider

@synthesize baseUrl = _baseUrl;

static CommonDataProvider * _sharedInst = nil;

+ (instancetype)sharedInst {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInst = [[CommonDataProvider alloc] init];
    });
    return _sharedInst;
}

- (NSString *)baseUrl {
    if (nil == _baseUrl) {
        _baseUrl = [[TSCache sharedInst] sqliteCacheForKey:kBaseUrl];
        if (nil == _baseUrl) {
            _baseUrl = BASE_URL;
        }
    }
    return _baseUrl;
}

- (void)setBaseUrl:(NSString *)baseUrl {
    if (![_baseUrl isEqualToString:baseUrl]) {
        _baseUrl = baseUrl;
        if ([_baseUrl isEqualToString:BASE_URL]) {
            [[TSCache sharedInst] setSqlitCache:nil forKey:kBaseUrl];
        } else {
            [[TSCache sharedInst] setSqlitCache:baseUrl forKey:kBaseUrl];
        }
    }
}

@end
