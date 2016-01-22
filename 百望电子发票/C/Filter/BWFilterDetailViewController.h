//
//  BWFilterDetailViewController.h
//  百望电子发票/Users/baiwang/Desktop/百望电子发票/百望电子发票/V/filterDetailTableViewCell.h
//
//  Created by baiwang on 16/1/22.
//  Copyright © 2016年 lixizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BWFilterDetailViewController;
@protocol BWFilterDetailViewControllerDelegate <NSObject>

- (void)filterVC:(BWFilterDetailViewController *)filterVC didSelectFilter:(NSDictionary *)filterDict dateDict:(NSDictionary *)dateDict;
- (void)removeAllFilterInFilterVC:(BWFilterDetailViewController *)filterVC;
- (void)dismissFilter:(BWFilterDetailViewController *)filterVC;


@end

@interface BWFilterDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *barView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,weak) id<BWFilterDetailViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *topView;
- (IBAction)cancelAction:(id)sender;
- (IBAction)clearAction:(id)sender;
- (IBAction)saveAction:(id)sender;


@end
