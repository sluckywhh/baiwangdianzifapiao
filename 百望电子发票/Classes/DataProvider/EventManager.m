//
//  EventManager.m
//
//  Created by Qitao on 11/8/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import "EventManager.h"
#import "ErrorConst.h"

#define sCalendarName       @"TS Todo"
#define sCalendarId         @"TS-MonkeyKing-sCalendarId"

@interface EventManager()

@end

@implementation EventManager

static EventManager * _sharedInst = nil;

+ (instancetype)sharedInst {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInst = [[EventManager alloc] init];
    });
    return _sharedInst;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.eventStore = [[EKEventStore alloc] init];
    }
    return self;
}

- (EKCalendar*) defaultCalendar
{
    NSString *identifier = [[NSUserDefaults standardUserDefaults] objectForKey:sCalendarId];
    EKCalendar * oldCal = [self.eventStore calendarWithIdentifier:identifier];
    if (oldCal) {
        return oldCal;
    }
    
    EKSource *localSource = nil;
    for (EKSource *source in self.eventStore.sources) {
        if (source.sourceType == EKSourceTypeCalDAV && [source.title isEqualToString:@"iCloud"])        {
            localSource = source;
            break;
        }
    }
    if (nil == localSource) {
        for (EKSource *source in self.eventStore.sources) {
            if (source.sourceType == EKSourceTypeLocal) {
                localSource = source;
                break;
            }
        }
    }

    // Create a new calendar.
    EKCalendar *calendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent eventStore:self.eventStore];
    calendar.title = sCalendarName;
    calendar.source = localSource;
    
    if ([self.eventStore saveCalendar:calendar commit:YES error:nil]) {
        [[NSUserDefaults standardUserDefaults] setObject:calendar.calendarIdentifier forKey:sCalendarId];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return calendar;
    }
    return nil;
}

- (void) createEventWithId:(NSString*)eventId title:(NSString*)title alarmDate:(NSDate*)alarmDate andResult:(eventBlock)block
{
    if (eventId.length == 0) {
        if (block) block(nil, ERR_MAKE(-1, @"Invalid Event"));
        return;
    }
    EKEventStore * eventStore = self.eventStore;
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                NSString * realId = [[NSUserDefaults standardUserDefaults] objectForKey:eventId];
                EKEvent *event = [eventStore eventWithIdentifier:realId];
                if (event) {
                    [eventStore removeEvent:event span:EKSpanFutureEvents error:nil];
                }
                
                // Create a new event object.
                event = [EKEvent eventWithEventStore:eventStore];
                event.title = title;
                event.calendar = [self defaultCalendar];
                
                // Set the start and end dates to the event.
                event.startDate = alarmDate;
                event.endDate = alarmDate;
                
                if (alarmDate) {
                    EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:alarmDate];
                    [event addAlarm:alarm];
                }
                
                if (block) block(event, error);
                
                [self.eventStore saveEvent:event span:EKSpanFutureEvents commit:YES error:nil];
                
                [[NSUserDefaults standardUserDefaults] setObject:event.eventIdentifier forKey:eventId];
                [[NSUserDefaults standardUserDefaults] synchronize];
            } else {
                if (block) block(nil, ERR_MAKE(-1, @"Calendar Permission not granted"));
            }
        });
    }];
}

- (NSArray *) getEventsOfSelectedCalendar
{
    // Specify the calendar that will be used to get the events from.
    EKCalendar * calendar = [self defaultCalendar];
    
    // Create a predicate value with start date a year before and end date a year after the current date.
    int yearSeconds = 365 * (60 * 60 * 24);
    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-yearSeconds] endDate:[NSDate dateWithTimeIntervalSinceNow:yearSeconds] calendars:@[calendar]];
    
    // Get an array with all events.
    NSArray *eventsArray = [self.eventStore eventsMatchingPredicate:predicate];
    
    // Copy all objects one by one to a new mutable array, and make sure that the same event is not added twice.
    NSMutableArray *uniqueEventsArray = [[NSMutableArray alloc] init];
    for (int i=0; i<eventsArray.count; i++) {
        EKEvent *currentEvent = [eventsArray objectAtIndex:i];
        
        BOOL eventExists = NO;
        
        // Check if the current event has any recurring rules set. If not, no need to run the next loop.
        if (currentEvent.recurrenceRules != nil && currentEvent.recurrenceRules.count > 0) {
            for (int j=0; j<uniqueEventsArray.count; j++) {
                if ([[[uniqueEventsArray objectAtIndex:j] eventIdentifier] isEqualToString:currentEvent.eventIdentifier]) {
                    // The event already exists in the array.
                    eventExists = YES;
                    break;
                }
            }
        }
        
        // If the event does not exist to the new array, then add it now.
        if (!eventExists) {
            [uniqueEventsArray addObject:currentEvent];
        }
    }
    
    // Sort the array based on the start date.
    uniqueEventsArray = (NSMutableArray *)[uniqueEventsArray sortedArrayUsingSelector:@selector(compareStartDateWithEvent:)];
    
    // Return that array.
    return (NSArray *)uniqueEventsArray;
}

- (void) existEventWithId:(NSString*)eventId andResult:(eventBlock)block
{
    EKEventStore * eventStore = self.eventStore;
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                NSString * realId = [[NSUserDefaults standardUserDefaults] objectForKey:eventId];
                EKEvent *event = [eventStore eventWithIdentifier:realId];
                if (event) {
                    if (block) block(event, nil);
                } else {
                    if (block) block(nil, ERR_MAKE(0, @"Event Not Exist"));
                }
            } else {
                if (block) block(nil, ERR_MAKE(-1, @"Calendar Permission not granted"));
            }
        });
    }];
}

- (void) deleteEventWithId:(NSString*)eventId andResult:(eventBlock)block
{
    EKEventStore * eventStore = self.eventStore;
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                NSString * realId = [[NSUserDefaults standardUserDefaults] objectForKey:eventId];
                EKEvent *event = [eventStore eventWithIdentifier:realId];
                if (event) {
                    [eventStore removeEvent:event span:EKSpanFutureEvents error:nil];
                }
                if (block) block(nil, nil);
            } else {
                if (block) block(nil, ERR_MAKE(-1, @"Calendar Permission not granted"));
            }
        });
    }];
}


@end
