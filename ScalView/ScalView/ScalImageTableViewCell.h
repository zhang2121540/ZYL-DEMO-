//
//  ScalImageTableViewCell.h
//  ScalView
//
//  Created by 张一力 on 15/6/15.
//  Copyright (c) 2015年 张一力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScalImageTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * customLabel;
@property(nonatomic,strong)UIImageView * leftImage;
@property(nonatomic,retain)UIImageView * fullImage;
//- (void)setLabelText:(NSString *)text;

@end
