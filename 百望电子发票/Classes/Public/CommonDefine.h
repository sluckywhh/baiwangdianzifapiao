//
//  CommonDefine.h
//  tradeshiftHome
//
//  Created by taq on 5/23/14.
//  Copyright (c) 2014 Tradeshift. All rights reserved.
//

#ifndef tradeshiftHome_CommonDefine_h
#define tradeshiftHome_CommonDefine_h


#define DEGREES_TO_RADIANS(x)       (x * M_PI/180.0)

#define MAIN_WINDOW                 ([UIApplication sharedApplication].delegate.window)
#define ROOT_VIEW_CONTROLLER        (MAIN_WINDOW.rootViewController)

#define DocumentDirectory           [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define SchemaDirectory             [DocumentDirectory stringByAppendingPathComponent:@"schema.json"]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                    blue:((float)(rgbValue & 0xFF))/255.0 \
                                    alpha:1.0]
#define UIColerFromRGBAlpha(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                        blue:((float)(rgbValue & 0xFF))/255.0 \
                                        alpha:((float)((rgbValue & 0xFF000000) >> 24))/255.0]
#define IS_IPHONE_4_AND_OLDER ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) (!([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending))

#define USER_SIGNUP_SUCCESS         @"USER_SIGNUP_SUCCESS"

#define ErrorCode                   @"ErrorCode"
#define ErrorMessage                @"NSLocalizedDescription"//    @"Message"
#define ParseError                  @"ParseError"

#define Localize(key)               NSLocalizedStringFromTable(key, @"InfoPlist", nil)
#define Instantiate(stID, vcID)     [[UIStoryboard storyboardWithName:stID bundle:nil] instantiateViewControllerWithIdentifier:vcID]
#define FirstInst(stID)             [[UIStoryboard storyboardWithName:stID bundle:nil] instantiateInitialViewController]

// color define
#define UIImageViewNamed(imageName) [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]]

#define CollectionViewCellSeperatorID   @"TSCollectionViewCellSeperatorID"

#define FONT_EX                 [UIFont systemFontOfSize:36.f]
#define FONT_XL                 [UIFont systemFontOfSize:20.f]
#define FONT_XL_B               [UIFont boldSystemFontOfSize:20.f]
#define FONT_L                  [UIFont systemFontOfSize:16.f]
#define FONT_M                  [UIFont systemFontOfSize:14.f]
#define FONT_S                  [UIFont systemFontOfSize:13.f]
#define FONT_XS                 [UIFont systemFontOfSize:10.f]


#define  BLUE_BUTTON              UIColorFromRGB(0x368CE8)                   //Button Color
#define  RED_BUTTON               UIColorFromRGB(0xB20000)                  //Button Color
#define  GREEN_BUTTON             UIColorFromRGB(0x67A52F)                 //Button Color
#define  HOLLOW_BUTTON            UIColorFromRGB(0x61ADEE)                 //Hollow Button, center is white
#define  WHITE_BG                UIColorFromRGB(0xFFFFFF)              // Background Color
#define  BLUE_BG                 UIColorFromRGB(0x368CE8)              //Background Color
#define  BLACK_BG                UIColorFromRGB(0x282828)              //Background Color
#define  LIGHT_YELLOW_BG         UIColorFromRGB(0xFBFEC7)             //Background Color
#define  GREEN_BG                UIColorFromRGB(0x67A52F)             //Background Color
#define  GREEN_NOTIFICATION      UIColorFromRGB(0x67A52F)            //Notification Color
#define  BLACK_NOTIFICATION      UIColorFromRGB(0x282828)            //Notification Color
#define  LIGHT_YELLOW_NOTIFICATION   UIColorFromRGB(0xFBFEC7)        //Notification Color


#define ACTIONBAR_BG_DARK       UIColorFromRGB(0x282828)                    //NavigationBar background
#define ACTIONBAR_BG_LIGHT      UIColorFromRGB(0x393939)                    //NavigationBar background
#define GREY_DARK               UIColorFromRGB(0x3e444c)                    //Normal text, Line 1 text
#define GREY_NORMAL             UIColorFromRGB(0x989a9c)                    //Explain Line2, Line3 text, Disabled button
#define BLUE_BTN                [UIColor colorWithRed:0 green:0.478431 blue:1.0 alpha:1.0]  // ios7 system blue
#define GREY_LIGHT              UIColorFromRGB(0xc5c9cd)                    //Placeholder text, Pressed text
#define GREY_LIGHT_ALPHA        UIColorFromRGB(0xeff1f4)                    //Disabled, Divider line
#define GREY_PRESS              UIColorFromRGB(0xeef2f5)                    //Pressed background, Background
#define HIGHLIGHT_NORMAL        UIColorFromRGB(0x20a0e9)
#define HIGHLIGHT_LIGHT         UIColorFromRGB(0x62baf1)                    //Link text
#define HIGHLIGHT_DARK          UIColorFromRGB(0x1a7bb2)                    //Pressed button, background
#define ERROR_COLOR             UIColorFromRGB(0xf85144)                    //Alert background, Error text
#define WHITE                   UIColorFromRGB(0xffffff)                    //Button text, navigationbar text, light theme
#define COMMON_BG               UIColorFromRGB(0xc9001b)
#define SEARCHBAR_BG            [UIColor colorWithRed:0.78125 green:0.78125 blue:0.78125 alpha:1.0]
#define WHITE_ALPHA             [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9]
#define MASK_BLACK              [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define TS_BLUE                 [UIColor colorWithRed:93.0/255 green:158.0/255 blue:230.0/255.0 alpha:1.0]
#define   NAV_BLUE              UIColorFromRGB(0x20a0e9)

#define WECHAT_APPID            @"wx6f98f29798dd1f03"
#define WECHAT_APPSECRET        @"690c6b1798596ed28af646950e146aa2"
#define WEIBO_APPKEY            @"821342677"
#define WEIBO_APPSECRECT        @"c2f508988ae03bd812cc8b05df0038b1"
#define WEIBO_REDIRECT_URL      @"https://api.weibo.com/oauth2/default.html"

#define INSTALL_URL             @"http://fir.im/y764"

#define ESCALATED               @"ESCALATED"
#define EslcationFormat         @"app:Tradeshift.Escalation.AssignmentEntryService"

#define CONSTRAINT_WIDTH(view, width) [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]
#define CONSTRAINT_HEIGHT(view, height) [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]
#define CONSTRAINT_CENTERX(view1, view2) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]
#define CONSTRAINT_CENTERY(view1, view2) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]
#define CONSTRAINT_LEADING(view1, view2, lead) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:lead]
#define CONSTRAINT_TAILING(view1, view2, trail) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:trail]
#define CONSTRAINT_TOP(view1, view2, top) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1.0 constant:top]
#define CONSTRAINT_BOTTOM(view1, view2, bottom) [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:bottom]

static NSString* TSRequestErrorDomain = @"com.tradeshift.mobile";

#endif
