//
//  UIImage+Color.h
//  tradeshiftHome
//
//  Created by Rain on 14-9-1.
//  Copyright (c) 2014年 Tradeshift. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)maskedImageNamed:(NSString *)name color:(UIColor *)color;
+ (UIImage *)podImage:(NSString *)name;

@end
