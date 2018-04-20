//
//  ViewController.m
//  ImageCarousel
//
//  Created by HangDian on 2018/4/18.
//  Copyright © 2018年 HangDian. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import "HDAnnouncementVC.h"
@interface ViewController ()<SDCycleScrollViewDelegate>

@end

@implementation ViewController{
    SDCycleScrollView *_customCellScrollViewDemo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, self.view.bounds.size.width, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor blackColor]; // 自定义分页控件小圆标颜色
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self.view addSubview:cycleScrollView];
    
    SDCycleScrollView *cycleScrollViewText = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(60, 460, self.view.bounds.size.width-80, 20) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollViewText.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollViewText.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    cycleScrollViewText.scrollDirection = UICollectionViewScrollDirectionVertical;
    cycleScrollViewText.onlyDisplayText = YES;
    NSArray *titlesArray = @[@"女神你好",@"还是你,女神你好",@"又是你123木头人"];
    cycleScrollViewText.titlesGroup = titlesArray;
    [cycleScrollViewText disableScrollGesture];//不让手动滚动,只能跑马滚动
    [self.view addSubview:cycleScrollViewText];
    //公告图标
    UIImageView *announcementImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1imge"]];
    [self.view addSubview:announcementImage];
    [announcementImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cycleScrollView);
        make.top.equalTo(cycleScrollView.mas_bottom);
        make.right.equalTo(cycleScrollViewText.mas_left);
        make.height.equalTo(cycleScrollViewText);
    }];
    //返回按钮图标
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backImage"]];
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cycleScrollViewText);
        make.centerY.equalTo(cycleScrollViewText.mas_centerY);
        make.right.equalTo(cycleScrollView);
    }];
    
}
#pragma mark - 点击公告跳转到相应的公告中
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    if (cycleScrollView.onlyDisplayText==YES) { //点击了公告的代理
        NSLog(@"你点击了第%ld条公告",(long)index);
        NSString *str = cycleScrollView.titlesGroup[index];
        HDAnnouncementVC *newController = [HDAnnouncementVC new];
        newController.announcementString = str;
        [self.navigationController pushViewController:newController animated:YES];

    }else{ //点击了滚动图片
        NSLog(@"你点击了第%ld张图片",(long)index);
    }
}


@end
