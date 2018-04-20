//
//  HDAnnouncementVC.m
//  ImageCarousel
//
//  Created by HangDian on 2018/4/18.
//  Copyright © 2018年 HangDian. All rights reserved.
//

#import "HDAnnouncementVC.h"

@interface HDAnnouncementVC ()

@end

@implementation HDAnnouncementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.center.y, self.view.bounds.size.width, 20)];
    label.text = self.announcementString;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
