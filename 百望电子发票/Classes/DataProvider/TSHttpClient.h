//
//  TSHttpClient.h
//  tradeshiftHome
//
//  Created by taq on 5/14/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

typedef enum {
    eSerializationTextType = 0,
    eSerializationJsonType,
    eSerializationDataType
} eSerializationType;

@interface ClientConfig : NSObject

@property (nonatomic, strong)   NSString *     cfgName;
@property (nonatomic, strong)   NSString *     hostUrl;
@property (nonatomic)   eSerializationType     reqSerialType;
@property (nonatomic)   eSerializationType     respSerialType;

- (BOOL) isValid;
- (NSString*) clientKey;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface TSHttpClient : NSObject

+ (AFHTTPSessionManager *) sessionManagerWithConfig:(ClientConfig*)config forceReset:(BOOL)force;

@end