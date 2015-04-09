//
//  News.h
//  CM
//
//  Created by liangyu on 15-4-7.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, strong)UIImage *headImage;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *lastContent;
@property (nonatomic, strong)NSString *lastTime;
@property (nonatomic, assign)NSInteger number;
@end
