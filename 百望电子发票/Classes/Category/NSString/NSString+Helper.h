//
//  NSString+MD5.h
//  Location
//
//  Created by taq on 10/20/14.
//  Copyright (c) 2014 Location. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (MD5)

//MD5
- (NSString *)MD5;
- (NSData*)MD5CharData;

//URL Encoding&Decoding
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

//Utility
- (BOOL)contains:(NSString*)string;
- (NSString*)add:(NSString*)string;
- (NSDictionary*)firstAndLastName;
- (BOOL)isValidEmail;
- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (NSString*)safeSubstringToIndex:(NSUInteger)index;
- (NSString*)stringByRemovingPrefix:(NSString*)prefix;
- (NSString*)stringByRemovingPrefixes:(NSArray*)prefixes;
- (BOOL)hasPrefixes:(NSArray*)prefixes;
- (BOOL)isEqualToOneOf:(NSArray*)strings;

//Size
- (CGSize)sizeWithFont:(UIFont *)font andWidth:(CGFloat)width;

@end
