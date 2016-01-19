//
//  CommonDataProvider.h
//  MonkeyKing
//
//  Created by taq on 8/18/15.
//  Copyright (c) 2015 Chuan Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDataProvider : NSObject

+ (instancetype)sharedInst;

- (NSString*) baseUrl;
- (void)setBaseUrl:(NSString *)baseUrl;

@end
