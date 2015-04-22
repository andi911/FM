//
//  ChatCell.h
//  CM
//
//  Created by liangyu on 15/4/22.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

typedef enum {
    MessageFrom = 0,
    MessageTo
} ChartMessageType;

#import <UIKit/UIKit.h>
#import "ChartContentView.h"
#import "ChartMessage.h"
@interface ChatCell : UITableViewCell
@property (nonatomic, assign)ChartMessageType messageType;
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)ChartContentView *chartView;
@property (nonatomic, strong)ChartMessage *message;
@property (nonatomic, assign) CGFloat cellHeight; //cell高度
@end
