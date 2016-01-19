//
//  TSCompoundResponseSerializer.m
//  tradeshiftHome
//
//  Created by Chuan Li on 8/14/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "TSCompoundResponseSerializer.h"
#import "CommonDefine.h"
#import "NSDictionary+Helper.h"

@implementation TSCompoundResponseSerializer

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
                    data:(NSData *)data
                   error:(NSError  **)error{
    BOOL responseIsValid = YES;
    NSError *validationError = nil;
    
    if (response && [response isKindOfClass:[NSHTTPURLResponse class]]) {
        if (self.acceptableStatusCodes && ![self.acceptableStatusCodes containsIndex:(NSUInteger)response.statusCode]) {
            NSError* parseError = nil;
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError]];;
            if (parseError) {
                userInfo[ErrorCode] = ParseError;
                userInfo[ErrorMessage] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
            if ([[userInfo allKeys] containsObject:@"error"]) {
                userInfo[ErrorCode] = [userInfo stringForKey:@"error" defaultValue:nil];
                userInfo[ErrorMessage] = [userInfo stringForKey:@"error_description" defaultValue:nil];
            }
            if ([[userInfo allKeys] containsObject:@"Message"]){
                userInfo[ErrorMessage] = userInfo[@"Message"];
            }
            validationError =[NSError errorWithDomain:TSRequestErrorDomain code:[*error code] userInfo:userInfo];
            
            responseIsValid = NO;
        }
    }
    
    if (error && !responseIsValid) {
        *error = validationError;
    }
    
    return responseIsValid;
}


@end
