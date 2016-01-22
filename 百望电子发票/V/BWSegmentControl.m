//
//  BWSegmentControl.m
//  百望电子发票
//
//  Created by baiwang on 16/1/21.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import "BWSegmentControl.h"
#import "UIView+Common.h"
#import "Header.h"

@interface BWSegmentControl()
@property (nonatomic,strong) UIView *tabIndicator;
@property (nonatomic,weak) UIButton *currentTab;
//- (void)_tabSelected:(UIButton *)btn;

@end

@implementation BWSegmentControl



- (void)prepareForInterfaceBuilder{
    if (_segments) {
        return;
    }
    
    _segments = @[@"登陆手机",@"登陆邮箱",@"绑定手机"];
    if ([_segments count] > 0) {
        float step = self.frame.size.width/[_segments count];
        for (int  i = 0; i < [_segments count]; i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(step * i, 0, step,self.frame.size.height )];
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:84/255.0 green:146/255.0 blue:209/255.0 alpha:1.0] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor colorWithRed:84/255.0 green:146/255.0 blue:209/255.0 alpha:1.0] forState:UIControlStateSelected];
            btn.tag = i;
            [btn setTitle:[_segments objectAtIndex:i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn addTarget:self action:@selector(_tabSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if (i == 0) {
                btn.selected = YES;
                self.currentTab = btn;
                [UIView animateWithDuration:0.3 animations:^{
                    self.tabIndicator.centerX = self.currentTab.centerX;
                
                } completion:^(BOOL finished) {
                    [self.delegate didSelectTab:self.currentTab.tag];
                    
                }];
            }
        }
        
        self.tabIndicator = [[UIView alloc]initWithFrame:CGRectMake(0, (self.frame.size.height - 2), step, 2.0)];
        self.tabIndicator.backgroundColor = [UIColor colorWithRed:84/255.0 green:146/255.0 blue:209/255.0 alpha:1.0];
        [self addSubview:self.tabIndicator];
    }
}

- (void)layoutSubviews{//验证
    [self prepareForInterfaceBuilder];
    
}



- (void)_tabSelected:(UIButton *)btn{
    if (btn == self.currentTab) {
        return;
    }
    self.currentTab.selected = NO;
    btn.selected = YES;
    self.currentTab = btn;
    
    [UIView animateWithDuration:0.3 animations:^{
       self.tabIndicator.centerX = self.currentTab.centerX;
    } completion:^(BOOL finished) {
        [self.delegate didSelectTab:self.currentTab.tag];
    }];
}

@end
