//
//  RootTableViewController.h
//  CM
//
//  Created by liangyu on 15-4-7.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewController : UITableViewController
@property (nonatomic, strong)NSMutableArray *newsList;
- (void)pushNewViewController:(UIViewController *)newViewController;
@end
