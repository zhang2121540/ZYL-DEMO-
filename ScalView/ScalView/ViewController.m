//
//  ViewController.m
//  ScalView
//
//  Created by 张一力 on 15/6/15.
//  Copyright (c) 2015年 张一力. All rights reserved.
//

#import "ViewController.h"
#import "ScalImageTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView * customTab = [UITableView new];
    customTab.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    customTab.dataSource = self;
    customTab.delegate = self;
    customTab.tag = 9999;
    customTab.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:customTab];
    
    
}
#define mark TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self creatArray] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = @{@16.0:NSFontAttributeName
                           };
    NSAttributedString * attributedText = [[NSAttributedString alloc]initWithString:[self creatArray][indexPath.row] attributes:dic];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGFloat height = rect.size.height;
    if (height < 140) {
        height = 140;
    }else{
        height += 20;
    }
    return height;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"kcell";
    ScalImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ScalImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.customLabel.text = [self creatArray][indexPath.row];
    return cell;
}

- (NSArray *)creatArray
{
    
    NSString * str1 = @"测试测试测试测试测试测试测试测试测试";
    NSString * str2 = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    NSString * str3 = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测";
    NSString * str4 = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    NSString * str5 = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    NSString * str6 = @"测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测";
    NSString * str7 = @"测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测";
    NSString * str8 = @"测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测";
    NSString * str9 = @"测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测";
    NSString * str10 = @"测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测测试测试测试测试测";
    
    NSArray * strArray = @[str1,str2,str3,str4,str5,str6,str7,str8,str9,str10];
    return strArray;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
