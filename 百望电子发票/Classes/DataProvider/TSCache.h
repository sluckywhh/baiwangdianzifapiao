//
//  TSConfig.h
//  tradeshiftHome
//
//  Created by taq on 5/22/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

//////// Important: Please use this class in main thread
//////// TODO: this class is not thread safe for this version

#import <Foundation/Foundation.h>

@interface TSCache : NSObject

+ (instancetype)sharedInst;

- (id) memCacheForKey:(NSString*)key;
- (void) setMemCache:(id)obj forKey:(NSString*)key;
- (void) setMemCache:(id)obj forKey:(NSString*)key expiresIn:(NSTimeInterval)expire;

- (id) sqliteCacheForKey:(NSString*)key;
- (void) setSqlitCache:(id)obj forKey:(NSString*)key;
- (void) setSqlitCache:(id)obj forKey:(NSString*)key expiresIn:(NSTimeInterval)expire;

- (id) fileCacheForKey:(NSString*)key;
- (void) setFileCache:(id)obj forKey:(NSString*)key;
- (void) setFileCache:(id)obj forKey:(NSString*)key expiresIn:(NSTimeInterval)expire;

- (id) keychainCacheForKey:(NSString*)key;
- (void) setKeychainCache:(id)obj forKey:(NSString*)key;

@end
