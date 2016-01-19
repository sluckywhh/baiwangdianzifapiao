//
//  SingtonManager.m
//  tradeshiftHome
//
//  Use to manage long live object
//
//  Created by taq on 9/4/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "SingtonManager.h"

@interface SingtonRef : NSObject

@property (nonatomic, copy) SingtonInitBlock    initBlock;
@property (nonatomic, weak) id                  ref;

@end

@implementation SingtonRef

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface SingtonManager ()

@property (nonatomic, retain) NSMutableDictionary *         singtonDict;

@end

@implementation SingtonManager

static SingtonManager * _sharedInst = nil;

+ (instancetype)sharedInst {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInst = [[SingtonManager alloc] init];
    });
    return _sharedInst;
}

- (id)init {
    self = [super init];
    if (self) {
        _singtonDict = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    return self;
}

- (void) registerClass:(NSString*)clsName withInitBlock:(SingtonInitBlock)initBlock
{
    if (clsName) {
        SingtonRef * ref = [SingtonRef new];
        ref.initBlock = initBlock;
        _singtonDict[clsName] = ref;
    }
}

- (id) singtonOfClass:(NSString*)clsName
{
    if (clsName) {
        SingtonRef * ref = _singtonDict[clsName];
        if (nil == ref) {
            ref = [SingtonRef new];
            _singtonDict[clsName] = ref;
        }
        
        id inst = ref.ref;
        if (nil == inst) {
            if (ref.initBlock) {
                inst = ref.initBlock(NSClassFromString(clsName));
            }
            if (nil == inst) {
                inst = [NSClassFromString(clsName) new];
            }
            ref.ref = inst;
        }

        return inst;
    }
    return nil;
}

@end
