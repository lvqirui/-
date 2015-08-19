//
//  ActivityCell.h
//  LessonUI_18_KVO检测图片下载
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@interface ActivityCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *loc_nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic,retain)Activity * activity;

@end
