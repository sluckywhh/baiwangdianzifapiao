//
//  EventManager.h
//
//  Created by Qitao on 11/8/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

typedef void (^eventBlock)(id obj, NSError * err);

@interface EventManager : NSObject

+ (instancetype)sharedInst;

@property (nonatomic, strong) EKEventStore *eventStore;

- (void) createEventWithId:(NSString*)eventId title:(NSString*)title alarmDate:(NSDate*)alarmDate andResult:(eventBlock)block;
- (void) existEventWithId:(NSString*)eventId andResult:(eventBlock)block;
- (void) deleteEventWithId:(NSString*)eventId andResult:(eventBlock)block;

@end
