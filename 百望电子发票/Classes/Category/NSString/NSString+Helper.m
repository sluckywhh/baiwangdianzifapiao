//
//  NSString+MD5.m
//  Location
//
//  Created by taq on 10/20/14.
//  Copyright (c) 2014 Location. All rights reserved.
//

#import "NSString+Helper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5)

- (NSString*)MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

// returns, nsdata for actual md5 bytes not hex string
- (NSData*)MD5CharData
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    NSData	*data = [NSData dataWithBytes:(const void *)md5Buffer length:sizeof(unsigned char)*CC_MD5_DIGEST_LENGTH];
    
    return data;
}

- (NSString *)URLEncodedString
{
    __autoreleasing NSString *encodedString;
    NSString *originalString = (NSString *)self;
    encodedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                          NULL,
                                                                                          (__bridge CFStringRef)originalString,
                                                                                          NULL,
                                                                                          (CFStringRef)@":!*();@/&?#[]+$,='%’\"",
                                                                                          kCFStringEncodingUTF8
                                                                                          );
    return encodedString;
}

- (NSString *)URLDecodedString
{
    __autoreleasing NSString *decodedString;
    NSString *originalString = (NSString *)self;
    decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                                                          NULL,
                                                                                                          (__bridge CFStringRef)originalString,
                                                                                                          CFSTR(""),
                                                                                                          kCFStringEncodingUTF8
                                                                                                          );
    return decodedString;
}

- (BOOL)contains:(NSString*)string {
    return [self rangeOfString:string].location != NSNotFound;
}

#define MaxEmailLength 254
- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL validEmail = [emailTest evaluateWithObject:self];
    if(validEmail && self.length <= MaxEmailLength)
        return YES;
    return NO;
}

- (NSString*)add:(NSString*)string
{
    if(!string || string.length == 0)
        return self;
    return [self stringByAppendingString:string];
}

- (NSDictionary*)firstAndLastName
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSArray *comps = [self componentsSeparatedByString:@" "];
    if(comps.count > 0) dic[@"firstName"] = comps[0];
    if(comps.count > 1) dic[@"lastName"] = comps[1];
    return dic;
}

- (BOOL)containsOnlyLetters
{
    NSCharacterSet *blockedCharacters = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbers = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbers].location == NSNotFound);
}

- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *blockedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

- (NSString*)safeSubstringToIndex:(NSUInteger)index
{
    if(index >= self.length)
        index = self.length - 1;
    return [self substringToIndex:index];
}

- (NSString*)stringByRemovingPrefix:(NSString*)prefix
{
    NSRange range = [self rangeOfString:prefix];
    if(range.location == 0) {
        return [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

- (NSString*)stringByRemovingPrefixes:(NSArray*)prefixes
{
    for(NSString *prefix in prefixes) {
        NSRange range = [self rangeOfString:prefix];
        if(range.location == 0) {
            return [self stringByReplacingCharactersInRange:range withString:@""];
        }
    }
    return self;
}

- (BOOL)hasPrefixes:(NSArray*)prefixes
{
    for(NSString *prefix in prefixes) {
        if([self hasPrefix:prefix])
            return YES;
    }
    return NO;
}

- (BOOL)isEqualToOneOf:(NSArray*)strings
{
    for(NSString *string in strings) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

- (CGSize)sizeWithFont:(UIFont *)font andWidth:(CGFloat)width{
    NSAttributedString* attributedText = [[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(width, 100000.f) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return CGSizeMake(ceilf(rect.size.width), ceilf(rect.size.height));
}

@end
