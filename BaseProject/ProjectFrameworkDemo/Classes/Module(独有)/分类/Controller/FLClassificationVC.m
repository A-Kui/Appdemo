//
//  FLClassificationVC.m
//  ProjectFrameworkDemo
//
//  Created by yons on 2018/12/13.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "FLClassificationVC.h"
#import "YUHoriView.h"
@interface FLClassificationVC ()
@property (strong,nonatomic) YUHoriView* cod_btnsview;
@end

@implementation FLClassificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分类";
    [self classify];
}
-(void)classify{
    
    CGRect r0 = CGRectMake(0,56,self.view.frame.size.width,70);
    YUHoriView *view = [[YUHoriView alloc]initWithFrame:r0];
    view.backgroundColor = [UIColor orangeColor];
    view.titles = @[@"电脑",@"数码",@"美妆",@"男装",@"童装",@"品牌",@"手机",@"数码",@"美妆",@"男装",@"童装",@"品牌",@"手机"];
    view.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
    };
    [view refresh];
    [self.view addSubview:view];
    _cod_btnsview = view;
    
}

@end
