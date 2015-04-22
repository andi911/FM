//
//  ChatCell.m
//  CM
//
//  Created by liangyu on 15/4/22.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import "ChatCell.h"
@implementation ChatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat wide = Screen_W ;
        CGFloat iconX = IconMarginX;
        CGFloat iconY = IconMarginY;
        CGFloat iconWidth = Icon_W;
        CGFloat iconHeight = Icon_H;
        
        if (self.messageType == MessageTo){
            iconX=wide-iconX-iconWidth;
        }
        self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(iconX, iconY, iconWidth, iconHeight)];
        [self addSubview:self.icon];
        
        CGFloat contentX=CGRectGetMaxX(self.icon.frame)+IconMarginX;
        CGFloat contentY=iconY;
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:13]};
        CGSize contentSize=[self.message.content boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        if(self.messageType == MessageTo){
            
            contentX=iconX-IconMarginX-contentSize.width-iconWidth;
        }
        self.cellHeight=MAX(CGRectGetMaxY(self.icon.frame), CGRectGetMaxY(self.chartView.frame))+IconMarginX;
        self.chartView = [[ChartContentView alloc]initWithFrame:CGRectMake(contentX, contentY, contentSize.width+35, contentSize.height+30)];
        [self addSubview:self.chartView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
