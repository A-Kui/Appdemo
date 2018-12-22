//
//  HomeVC.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 16/6/8.
//  Copyright © 2016年 xiaopao. All rights reserved.
//

#import "HomeVC.h"
#import "FWTestVC.h"
#import "MTSearchBar.h"
#import "SDCycleScrollView.h"
#import "UIImageView+WebCache.h"
@interface HomeVC ()<SDCycleScrollViewDelegate>
@property (strong,nonatomic)NSArray *localImages;//本地图片
@property (strong,nonatomic)NSArray *netImages;  //网络图片
@property (strong,nonatomic)SDCycleScrollView *cycleScrollView;//轮播器


@end

@implementation HomeVC
{
    NSArray *_imagesURLStrings;
    SDCycleScrollView *_customCellScrollViewDemo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self lunbotu];
    self.navigationItem.titleView = [MTSearchBar searchBar];
    
}
//*********************


-(void)lunbotu
{
    
    
    //*********************
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545302006428&di=38350f599b51009f102abce802e21e65&imgtype=0&src=http%3A%2F%2Fpic35.photophoto.cn%2F20150611%2F1155116231539801_b.jpg",
                                  @"http://pic36.photophoto.cn/20150802/1155116255105710_b.jpg",
                                  @"http://pic36.photophoto.cn/20150721/1155116259703361_b.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    // 情景三：图片配文字
    NSArray *titles = @[@"第一页title",
                        @"第二页title",
                        @"第三页title",
                        @" ",
                        @" "
                        ];
    
    CGFloat w = self.view.bounds.size.width;
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 如果你发现你的CycleScrollview会在viewWillAppear时图片卡在中间位置，你可以调用此方法调整图片位置
    //    [你的CycleScrollview adjustWhenControllerViewWillAppera];
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
     FWTestVC *testVC = [[FWTestVC alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}


//***************
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//   测试页
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    FWTestVC *testVC = [[FWTestVC alloc] init];
//
//    [self.navigationController pushViewController:testVC animated:YES];
//
//}

@end
