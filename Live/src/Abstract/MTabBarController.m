//
//  MTabBarController.m
//  Live
//
//  Created by Never on 2018/3/26.
//  Copyright © 2018年 Never. All rights reserved.
//

#import "MTabBarController.h"
#import "MVideoController.h"
#import "MLiveController.h"
#import "MMineController.h"

@interface MTabBarController ()

@end

@implementation MTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self addChildController];
}

- (void)setupUI {
    //设置背景色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    
    //去掉TabBar上部的横线
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    //设置tabBar阴影
    self.tabBar.layer.shadowColor = [UIColor grayColor].CGColor;
    self.tabBar.layer.shadowOpacity = 0.3f;
    self.tabBar.layer.shadowRadius = 4.f;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, 0);
}

- (void)addChildController {
    MVideoController *videoVC = [[MVideoController alloc] init];
    [self setChildController:videoVC Image:@"nav_home_normal" selectedImage:@"nav_home_activated" title:@"VIDEO"];
    
    MLiveController *liveVC = [[MLiveController alloc] init];
    [self setChildController:liveVC Image:@"nav_square_normal" selectedImage:@"nav_square_activated" title:@"LIVE"];
    
    MMineController *mineVC = [[MMineController alloc] init];
    [self setChildController:mineVC Image:@"nav_profile_normal" selectedImage:@"nav_profile_activated" title:@"MINE"];
}

- (void)setChildController:(UIViewController *)vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [navi.navigationBar setShadowImage:[UIImage new]];
    [navi.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    navi.navigationBar.backgroundColor = [UIColor whiteColor];
    //设置阴影
    navi.navigationBar.layer.shadowColor = [UIColor grayColor].CGColor;
    navi.navigationBar.layer.shadowOpacity = 0.3f;
    navi.navigationBar.layer.shadowRadius = 4.f;
    navi.navigationBar.layer.shadowOffset = CGSizeMake(0, 0);
    
    navi.navigationBar.translucent = NO;
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    vc.tabBarItem.image = myImage;
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = mySelectedImage;
    vc.tabBarItem.title = title;
    [self addChildViewController:navi];
    
}

@end
