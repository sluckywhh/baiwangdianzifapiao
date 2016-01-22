//
//  JSONModel+SwizzleMap.h
//  tradeshiftHome
//
//  Created by Chuan Li on 5/11/15.
//  Copyright (c) 2015 Tradeshift. All rights reserved.
//

#import "JSONModel/JSONModel.h"

@interface JSONModel (SwizzleMap)

- (NSString*)ts_mapString:(NSString*)string withKeyMapper:(JSONKeyMapper*)keyMapper importing:(BOOL)importing;

@end
