//
//  TSJSONResponseSerializer.m
//  tradeshiftHome
//
//  Created by Chuan Li on 8/14/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "TSJSONResponseSerializer.h"
#import "CommonDefine.h"
#import "NSDictionary+Helper.h"

@implementation TSJSONResponseSerializer

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
                    data:(NSData *)data
                   error:(NSError  **)error{
    BOOL responseIsValid = YES;
    NSError *validationError = nil;
    
    if (response && [response isKindOfClass:[NSHTTPURLResponse class]]) {
        if (self.acceptableStatusCodes && ![self.acceptableStatusCodes containsIndex:(NSUInteger)response.statusCode]) {
            NSError* parseError = nil;
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError]];
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

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        return nil;
    }
    
    NSStringEncoding stringEncoding = self.stringEncoding;
    if (response.textEncodingName) {
        CFStringEncoding encoding = CFStringConvertIANACharSetNameToEncoding((CFStringRef)response.textEncodingName);
        if (encoding != kCFStringEncodingInvalidId) {
            stringEncoding = CFStringConvertEncodingToNSStringEncoding(encoding);
        }
    }
    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:stringEncoding];
    if (responseString && ![responseString isEqualToString:@" "]) {
        data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        if ([data length] > 0) {
            NSError* parseError = nil;
            id responseObject = [NSJSONSerialization JSONObjectWithData:data options:self.readingOptions error:&parseError];
            if (parseError) {
                NSMutableDictionary* dict = [NSMutableDictionary dictionary];
                dict[ErrorMessage] = responseString;
                dict[ErrorCode] = ParseError;
                if (error) {
                    *error = [NSError errorWithDomain:TSRequestErrorDomain code:[*error code] userInfo:dict];
                }
            }
            return responseObject;
        }
        else {
            return nil;
        }
    }
    return nil;
}


@end
