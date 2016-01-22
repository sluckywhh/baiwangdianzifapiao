//
//  BWSegmentControl.h
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BWSegmentControlDelegate <NSObject>

- (void)didSelectTab:(NSUInteger)tabIndex;

@end

@interface BWSegmentControl : UIView

@property (nonatomic,readonly,strong) NSArray *segments;
@property (nonatomic,weak) id<BWSegmentControlDelegate> delegate;

@end
