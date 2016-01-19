//
//  TSToolUtil.h
//  tradeshiftHome
//
//  Created by taq on 5/15/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TSToolUtil : NSObject

+ (NSString*) geneRandomId;

+ (void)showConfirmAlertWithTitle:(NSString *)title andMessage:(NSString*)msg;
+ (UIViewController*) topMostController;

+ (NSString *)strTimeAgo:(NSDate*)date;

+ (BOOL) validateEmail:(NSString *)email;

+ (NSString *)createUUID;

+ (void)showToast:(NSString*)msg;
+ (BOOL) isOSSupported:(NSString*)minRequiredVersion;

+ (CGAffineTransform) transformForCurrentOrientation;

+ (BOOL) isFirstOpen;

@end
