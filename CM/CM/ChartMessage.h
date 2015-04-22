//
//  ChartMessage.h
//  CM
//
//  Created by liangyu on 15/4/22.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChartMessage : NSObject
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSString *icon;
@property (nonatomic, assign)int type;
@end
