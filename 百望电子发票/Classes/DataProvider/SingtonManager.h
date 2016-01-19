//
//  SingtonManager.h
//  tradeshiftHome
//
//  Created by taq on 9/4/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^SingtonInitBlock)(Class);

@interface SingtonManager : NSObject

+ (instancetype)sharedInst;

- (void) registerClass:(NSString*)clsName withInitBlock:(SingtonInitBlock)initBlock;
- (id) singtonOfClass:(NSString*)clsName;

@end
