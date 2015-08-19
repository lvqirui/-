//
//  ActivityCell.m
//  LessonUI_18_KVO检测图片下载
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setActivity:(Activity *)activity
{
    self.titleLabel.text = activity.title;
    self.loc_nameLabel.text = activity.loc_name;
    //self.imgView.image = activity.picture;
}

@end
