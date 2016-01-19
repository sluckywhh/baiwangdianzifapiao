//
//  TSToolUtil.m
//  tradeshiftHome
//
//  Created by taq on 5/15/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "TSToolUtil.h"
#import "CommonDefine.h"
#import "JGProgressHUD.h"
#import "JGProgressHUDFadeZoomAnimation.h"

static NSDateFormatter * sTimeIdFormatter = nil;

@implementation TSToolUtil

+ (NSString*) geneRandomId
{
    if (nil == sTimeIdFormatter) {
        sTimeIdFormatter = [[NSDateFormatter alloc] init];
        [sTimeIdFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        [sTimeIdFormatter setDateFormat:@"yyyyMMddHHmmss"];
    }
    static NSUInteger nameTail = 1;
    return [NSString stringWithFormat:@"%@%ld", [sTimeIdFormatter stringFromDate:[NSDate date]], (long)nameTail++];
}

+ (void)showConfirmAlertWithTitle:(NSString *)title andMessage:(NSString*)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

+ (UIViewController *)topMostController {
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

+ (NSString *)strTimeAgo:(NSDate*)date
{
    if (nil == date) {
        return nil;
    }
    const unsigned int unitFlags = NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay
    | NSCalendarUnitWeekOfYear | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents * dateInfo = [[NSCalendar currentCalendar] components:unitFlags fromDate:date toDate:[NSDate date] options:0];
    
    NSString * strReturn = @"";
    if ([dateInfo year] > 0) {
        strReturn = [NSString stringWithFormat:@"%ld %@", (long)[dateInfo year], NSLocalizedString(@"year ago", nil)];
    } else if ([dateInfo month] > 0) {
        strReturn = [NSString stringWithFormat:@"%ld %@", (long)[dateInfo month], NSLocalizedString(@"month ago", nil)];
    } else if ([dateInfo day] > 0) {
        strReturn = [NSString stringWithFormat:@"%ld %@", (long)[dateInfo day], NSLocalizedString(@"day ago", nil)];
    } else if ([dateInfo hour] > 0) {
        strReturn = [NSString stringWithFormat:@"%ld %@", (long)[dateInfo hour], NSLocalizedString(@"hour ago", nil)];
    } else if ([dateInfo minute] > 0) {
        strReturn = [NSString stringWithFormat:@"%ld %@", (long)[dateInfo minute], NSLocalizedString(@"minute ago", nil)];
    } else {
        strReturn = [NSString stringWithFormat:@"%@", NSLocalizedString(@"just now", nil)];
    }
    return strReturn;
}

+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (NSString *)createUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidObject));
    CFRelease(uuidObject);
    return uuidStr;
}

+ (void)showToast:(NSString*)msg
{
    JGProgressHUD *HUD = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleDark];
    HUD.interactionType = JGProgressHUDInteractionTypeBlockTouchesOnHUDView;
    HUD.animation = [JGProgressHUDFadeZoomAnimation animation];
    HUD.HUDView.layer.shadowColor = [UIColor blackColor].CGColor;
    HUD.HUDView.layer.shadowOffset = CGSizeZero;
    HUD.HUDView.layer.shadowOpacity = 0.4f;
    HUD.HUDView.layer.shadowRadius = 8.0f;
    
    HUD.indicatorView = nil;
    HUD.textLabel.text = msg;
    HUD.position = JGProgressHUDPositionBottomCenter;
    HUD.marginInsets = (UIEdgeInsets) {
        .top = 0.0f,
        .bottom = 20.0f,
        .left = 0.0f,
        .right = 0.0f,
    };
    [HUD showInView:MAIN_WINDOW];
    [HUD dismissAfterDelay:2.0];
}

+ (BOOL) isOSSupported:(NSString*)minRequiredVersion
{
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL isOSSupported = ([currSysVer compare:minRequiredVersion options:NSNumericSearch] != NSOrderedAscending) &&
    ![currSysVer isEqualToString:@"Unknown"];
    return isOSSupported;
}

+ (CGAffineTransform) transformForCurrentOrientation
{
    // Get orientation
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    // Choose the transform
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation((float)(M_PI*1.5));
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation((float)(M_PI/2));
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation((float)(-M_PI));
    } else {
        return CGAffineTransformIdentity;
    }
}

+ (BOOL) isFirstOpen
{
    static NSString * hasOpenBefore = @"kHasOpenBeforeKey";
    NSNumber * boolVal = [[NSUserDefaults standardUserDefaults] objectForKey:hasOpenBefore];
    if ([boolVal boolValue]) {
        return NO;
    }
    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:hasOpenBefore];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}



@end
