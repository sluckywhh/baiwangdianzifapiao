//
//  GViewController.m
//  tradeshiftHome
//
//  Created by taq on 5/13/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#import "GViewController.h"
#import "UIAlertView+Blocks.h"
#import "NSDictionary+Helper.h"
#import "JGProgressHUD.h"
#import "JGProgressHUDFadeZoomAnimation.h"
#import <objc/runtime.h>
#import "UIImage+Helper.h"
#import "MMMaterialDesignSpinner.h"


static const NSString * kHUDDismissKey = @"TS_prop_kHUDDismissKey";

@interface GViewController () <JGProgressHUDDelegate>

@property (nonatomic, strong) JGProgressHUD *           currentHUD;
@property (nonatomic, strong) UIRefreshControl *        pullRefresh;
@property (nonatomic, strong) MMMaterialDesignSpinner * gSpinner;

@end

@implementation GViewController

- (void) internalInit {
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self internalInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self internalInit];
    }
    return self;
}

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self internalInit];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.isAccessibilityElement = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:HIGHLIGHT_NORMAL] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: WHITE,
                                                                    NSFontAttributeName: FONT_XL};

    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = barBtnItem;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (JGProgressHUD *)prototypeHUD:(BOOL)isModel
{
    JGProgressHUD *HUD = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleDark];
    HUD.interactionType = isModel ? JGProgressHUDInteractionTypeBlockAllTouches : JGProgressHUDInteractionTypeBlockTouchesOnHUDView;
    HUD.animation = [JGProgressHUDFadeZoomAnimation animation];
    HUD.HUDView.layer.shadowColor = [UIColor blackColor].CGColor;
    HUD.HUDView.layer.shadowOffset = CGSizeZero;
    HUD.HUDView.layer.shadowOpacity = 0.4f;
    HUD.HUDView.layer.shadowRadius = 8.0f;
    
    return HUD;
}


- (void)showLoading
{
    self.isLoading = YES;
    if (self.currentHUD) {
        [self.currentHUD dismissAnimated:YES];
    }
    self.currentHUD = [self prototypeHUD:YES];
//    self.currentHUD.textLabel.text = @"LOADING TRADESHIFT...";
    
    [self.currentHUD showInView:self.view];
}

- (void)showLoadingNonModelOnView:(UIView*)view
{
    self.isLoading = YES;
    if (nil == self.gSpinner) {
        self.gSpinner = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    [view addSubview:self.gSpinner];
    self.gSpinner.center = CGPointMake(view.size.width/2.0, view.size.height/2.0);
    [self.gSpinner startAnimating];
}

- (void)hideLoading
{
    [self.currentHUD dismissAnimated:YES];
    self.currentHUD = nil;
    [self.gSpinner stopAnimating];
    self.isLoading = NO;
}


- (IBAction)goBack:(id)sender
{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)displayErrorWithAlert:(NSError*)error{
    if (nil == error) {
        return;
    }
    NSString *message = nil;
    message = [error localizedDescription];
    [UIAlertView showWithTitle:nil message:message cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:NULL];
}

- (void)showToast:(NSString*)msg onDismiss:(void (^)(id))handler
{
    if (msg.length > 0) {
        JGProgressHUD *HUD = [self prototypeHUD:NO];
        HUD.indicatorView = nil;
        HUD.textLabel.text = msg;
        HUD.textLabel.accessibilityLabel = @"Toast";
        HUD.position = JGProgressHUDPositionCenter;
        HUD.marginInsets = (UIEdgeInsets) {
            .top = 0.0f,
            .bottom = 0.0f,
            .left = 0.0f,
            .right = 0.0f,
        };
        if (handler) {
            HUD.delegate = self;
            objc_setAssociatedObject(HUD, &kHUDDismissKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
        
        HUD.accessibilityLabel = HUD.accessibilityIdentifier = @"Error";
        [HUD showInView:self.view];
        [HUD dismissAfterDelay:2.1];
    }
}

#pragma mark - Private Method
- (void)naviBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - JGProgressHUDDelegate
- (void)progressHUD:(JGProgressHUD *)progressHUD didDismissFromView:(UIView *)view{
    void (^handler)(id) = objc_getAssociatedObject(progressHUD, &kHUDDismissKey);
    if (handler) {
        handler(progressHUD);
    }
}

@end
