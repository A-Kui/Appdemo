//
//  MTSearchBar.m
//  ProjectFrameworkDemo
//
//  Created by yons on 2018/12/17.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "MTSearchBar.h"

@implementation MTSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.size = CGSizeMake(300, 30);
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入关键字";
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image = [UIImage imageNamed:@"home_icon_search"];
        searchIcon.contentMode = UIViewContentModeCenter;
        searchIcon.size =CGSizeMake(30, 30);
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
    
}
+(instancetype)searchBar
{
    return [[self alloc]init];
}


@end
