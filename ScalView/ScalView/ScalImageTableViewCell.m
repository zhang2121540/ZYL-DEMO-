//
//  ScalImageTableViewCell.m
//  ScalView
//
//  Created by 张一力 on 15/6/15.
//  Copyright (c) 2015年 张一力. All rights reserved.
//

#import "ScalImageTableViewCell.h"

@implementation ScalImageTableViewCell
{
    CGRect frame_first;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addCell];
    }
    return self;
}
/**
 *  自定义cell
 */
- (void)addCell
{
    
    
    self.leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 120)];
    
    
    
    
    
    
    
    
    self.leftImage.image = [UIImage imageNamed:@"2"];
    self.leftImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionTap:)];
    [self.leftImage addGestureRecognizer:tapGest];
    [self addSubview:self.leftImage];
    
    self.customLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.leftImage.frame.origin.x + self.leftImage.frame.size.width + 20, self.leftImage.frame.origin.x, 200, 40)];
    self.customLabel.numberOfLines = 0;
    self.customLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.customLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.customLabel];
    
}
- (void)layoutSubviews{
    CGFloat height = [self heightContent:self.customLabel.text];
    self.customLabel.frame = CGRectMake(110, 10, 200, height);
    
}
- (CGFloat)heightContent:(NSString *)text
{
    CGFloat height = [self heightOfLabelForString:text fontSizeAndLabelWidth:200 andFontsize:0];
    if (height < 140) {
        height = 140;
    }
    height += 20;
    return height;
}
- (CGFloat)heightOfLabelForString:(NSString *)text fontSizeAndLabelWidth:(CGFloat)width andFontsize:(CGFloat)fontSize
{
    NSDictionary * dic = @{@16.0:NSFontAttributeName
                           };
    NSAttributedString * attributedText = [[NSAttributedString alloc]initWithString:text attributes:dic];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect.size.height;
    
}
/**
 *  手势点击
 */
- (void)actionTap:(UITapGestureRecognizer *)tapGest
{
    
    [self viewController];
    UITableView * tableView = (UITableView *)[[self viewController].view viewWithTag:9999];
    
    frame_first = CGRectMake(self.frame.origin.x + self.leftImage.frame.origin.x, self.frame.origin.y + self.leftImage.frame.origin.y - tableView.contentOffset.y, self.leftImage.frame.size.width, self.leftImage.frame.size.height);
    
    self.fullImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
    self.fullImage.backgroundColor = [UIColor blackColor];
    self.fullImage.userInteractionEnabled = YES;
    self.fullImage.image = [UIImage imageNamed:@"2"];
    UITapGestureRecognizer * tapGest2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionTap2:)];
    [self.fullImage addGestureRecognizer:tapGest2];
    self.fullImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.window addSubview:self.fullImage];
    if (![self.fullImage subviews]) {
        self.fullImage.image = [UIImage imageNamed:@"2"];
        [self.window addSubview:self.fullImage];
        self.fullImage.frame = frame_first;
        [UIView animateWithDuration:0.5 animations:^{
            self.fullImage.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
        } completion:^(BOOL finished) {
            [UIApplication sharedApplication].statusBarHidden = YES;
        }];
        
    }
    
}
- (void)actionTap2:(UITapGestureRecognizer *)tapGest
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.fullImage.frame=frame_first;
    } completion:^(BOOL finished) {
        
        [self.fullImage removeFromSuperview];
    }];
    [UIApplication sharedApplication].statusBarHidden=NO;
    
}
/**
 *  获取控制器
 */

- (UIViewController *)viewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    // If the view controller isn't found, return nil.
    return nil;
}



@end
