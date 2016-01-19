//
//  CommonModel.m
//  tradeshiftHome
//
//  Created by taq on 5/21/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "CommonModel.h"

@implementation CommonModel

// since the efficient issue using NSNumberFormatter to comvert NSString to NSNumber
// we do not handle number object here
// please call indepentend number safe convert below
+ (id)safeObj:(id)origObj withClass:(Class)cls
{
    if (nil == origObj || [origObj isKindOfClass:cls]) {
        return origObj;
    }
    if ([cls isSubclassOfClass:[CommonModel class]]) {
        CommonModel * obj = [[cls alloc] init];
        [obj mappingWithJsonDict:origObj];
        return obj;
    }
    return [NSString stringWithFormat:@"%@", origObj];
}

+ (int)safeIntVal:(id)origObj
{
    if (origObj && [origObj respondsToSelector:@selector(intValue)]) {
        return [origObj intValue];
    }
    return 0;
}

+ (NSNumber*)safeIntObj:(id)origObj
{
    return [NSNumber numberWithInt:[self safeIntVal:origObj]];
}

+ (float)safeFloatVal:(id)origObj
{
    if (origObj && [origObj respondsToSelector:@selector(floatValue)]) {
        return [origObj floatValue];
    }
    return 0;
}

+ (NSNumber*)safeFloatObj:(id)origObj
{
    return [NSNumber numberWithFloat:[self safeFloatVal:origObj]];
}

+ (int)safeBoolVal:(id)origObj
{
    if (origObj && [origObj respondsToSelector:@selector(boolValue)]) {
        return [origObj boolValue];
    }
    return 0;
}

+ (NSNumber*)safeBoolObj:(id)origObj
{
    return [NSNumber numberWithInt:[self safeBoolVal:origObj]];
}

+ (NSArray*)checkArray:(id)origArr {
    NSArray * safeArr = origArr;
    if (![origArr isKindOfClass:[NSArray class]]) {
        safeArr = [NSArray arrayWithObject:origArr];
    }
    return safeArr;
}

+ (NSArray*)saveObjArr:(id)origArr withItemClass:(Class)cls
{
    if (nil == origArr) {
        return nil;
    }
    NSMutableArray * retArr = [NSMutableArray array];
    for (id item in [self checkArray:origArr]) {
        [retArr addObject:[self safeObj:item withClass:cls]];
    }
    return retArr;
}

+ (NSArray*)saveIntArr:(id)origArr
{
    if (nil == origArr) {
        return nil;
    }
    NSMutableArray * retArr = [NSMutableArray array];
    for (id item in [self checkArray:origArr]) {
        [retArr addObject:[self safeIntObj:item]];
    }
    return retArr;
}

+ (NSArray*)saveFloatArr:(id)origArr
{
    if (nil == origArr) {
        return nil;
    }
    NSMutableArray * retArr = [NSMutableArray array];
    for (id item in [self checkArray:origArr]) {
        [retArr addObject:[self safeFloatObj:item]];
    }
    return retArr;
}

+ (NSArray*)saveBoolArr:(id)origArr
{
    if (nil == origArr) {
        return nil;
    }
    NSMutableArray * retArr = [NSMutableArray array];
    for (id item in [self checkArray:origArr]) {
        [retArr addObject:[self safeBoolObj:item]];
    }
    return retArr;
}

+ (id) instWithJsonDict:(NSDictionary *)dict withErr:(NSError**)err {
    CommonModel * model = [[self alloc] initWithDictionary:dict error:err];
    return model;
}

- (void) mappingWithJsonDict:(NSDictionary *)dict {
    [self mergeFromDictionary:dict useKeyMapping:YES];
}

@end
