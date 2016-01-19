//
//  CommonModel.h
//  tradeshiftHome
//
//  Created by taq on 5/21/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@class CommonModel;

#define SafeObj(dict, key, cls)               [CommonModel safeObj:([(dict) objectForKey:(key)]) withClass:(cls)];
#define SafeString(dict, key)                 SafeObj((dict), (key), [NSString class])
#define SafeInt(dict, key)                    [CommonModel safeIntVal:([(dict) objectForKey:(key)])];
#define SafeIntObj(dict, key)                 [CommonModel safeIntObj:([(dict) objectForKey:(key)])];
#define SafeFloat(dict, key)                  [CommonModel safeFloatVal:([(dict) objectForKey:(key)])];
#define SafeFloatObj(dict, key)               [CommonModel safeFloatObj:([(dict) objectForKey:(key)])];
#define SafeBool(dict, key)                   [CommonModel safeBoolVal:([(dict) objectForKey:(key)])];
#define SafeBoolObj(dict, key)                [CommonModel safeBoolObj:([(dict) objectForKey:(key)])];

#define SafeObjArr(dict, key, cls)            [CommonModel saveObjArr:([(dict) objectForKey:(key)]) withItemClass:(cls)];
#define SafeModelArr(dict, key)               SafeObjArr((dict), (key), [CommonModel class])
#define SafeStringArr(dict, key)              SafeObjArr((dict), (key), [NSString class])
#define SafeIntArr(dict, key)                 [CommonModel saveIntArr:([(dict) objectForKey:(key)])];
#define SafeFloatArr(dict, key)               [CommonModel saveFloatArr:([(dict) objectForKey:(key)])];
#define SafeBoolArr(dict, key)                [CommonModel saveBoolArr:([(dict) objectForKey:(key)])];

@interface CommonModel : JSONModel

// util for safe data convert
+ (id)safeObj:(id)origObj withClass:(Class)cls;
+ (int)safeIntVal:(id)origObj;
+ (NSNumber*)safeIntObj:(id)origObj;
+ (float)safeFloatVal:(id)origObj;
+ (NSNumber*)safeFloatObj:(id)origObj;
+ (int)safeBoolVal:(id)origObj;
+ (NSNumber*)safeBoolObj:(id)origObj;

+ (NSArray *)checkArray:(id)origArr;

+ (NSArray*)saveObjArr:(id)origArr withItemClass:(Class)cls;
+ (NSArray*)saveIntArr:(id)origArr;
+ (NSArray*)saveFloatArr:(id)origArr;
+ (NSArray*)saveBoolArr:(id)origArr;

// please override this function in subclasses
- (void) mappingWithJsonDict:(NSDictionary*)dict;
+ (id) instWithJsonDict:(NSDictionary *)dict withErr:(NSError**)err;

@end
