//
//  GViewController.h
//  tradeshiftHome
//  a global viewcontroller for common stuff, currently do nothing
//
//  Created by taq on 5/13/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+Helper.h"
#import "CommonDefine.h"
#import "UIView+Common.h"

#define LOAD_MORE_FOOTER_ID     @"loadingMoreFooterId"

@interface GViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic) BOOL                              isLoading;
@property (nonatomic, strong) UIView *                  loadMoreView;
@property (nonatomic) BOOL                              enableLocationUpdate;   // default NO
@property (nonatomic, strong) NSString*                 backTitle;

@property (nonatomic) BOOL                              hideBackBtn;            // default NO

// subview should override it to do init issue
- (void) internalInit;

- (void)showLoading;
- (void)showLoadingNonModelOnView:(UIView*)view;
- (void)hideLoading;

- (void)displayErrorWithAlert:(NSError*)error;
- (void)showToast:(NSString*)msg onDismiss:(void (^)(id))handler;

- (IBAction)goBack:(id)sender;

@end
