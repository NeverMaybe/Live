//
//  MAbstractController.m
//  Live
//
//  Created by Never on 2018/3/26.
//  Copyright © 2018年 Never. All rights reserved.
//

#import "MAbstractController.h"

@interface MAbstractController ()

@end

@implementation MAbstractController

- (void)viewDidLoad {
    [super viewDidLoad];
    //统一背景视图
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect rect  = self.view.frame;
    rect.origin.y += 20;
    self.view.frame = rect;
    if (@available(iOS 11, *)){
        // --  屏蔽safeArea和pop抖动
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        // --  适配iOS11
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
    
    //判断有push栈时添加默认返回按钮
    if (self.navigationController.childViewControllers.count > 1) {
        [self setLeftNavigationItem];
    }else{
        [self setImageLeftNavigationItem:[UIImage imageNamed:@"myMessage"] andRightImage:[UIImage imageNamed:@"myHistory"]];
    }
}

- (void)setLeftNavigationItem
{
    UIImage *img = [UIImage imageNamed:@"userinside_backwhite"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(onClickLeft) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 0, 30, img.size.height)];
    [btn setImage:img forState:UIControlStateNormal];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backBtn;
}

- (void)setImageLeftNavigationItem:(UIImage *)leftImage andRightImage:(UIImage *)rightImage
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(onClickLeft) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setFrame:CGRectMake(0, 0, 30, leftImage.size.height)];
    [leftBtn setImage:leftImage forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(onClickLeft) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setFrame:CGRectMake(0, 0, 30, rightImage.size.height)];
    [rightBtn setImage:rightImage forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)onClickLeft
{
    if(self == self.navigationController.viewControllers[0]){
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setNavigationTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [label setNeedsLayout];
    [label layoutIfNeeded];
    label.frame = CGRectMake(0, 0, label.frame.size.width, 44);
    self.navigationItem.titleView = label;
}

- (MAbstractController *)pushCanvas:(NSString *) canvasName withArgument:(id)argumentData
{
    if (canvasName == nil) {
        return nil;
    }
    MAbstractController *abstractVC = nil;
    Class object = NSClassFromString(canvasName);
    abstractVC = (MAbstractController *)[[object alloc] init];
    if (abstractVC) {
        if ([abstractVC respondsToSelector:@selector(argumentForCanvas:)]) {
            if (argumentData) {
                [abstractVC argumentForCanvas:argumentData];
            }
        }
        abstractVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:abstractVC animated:YES];
    }
    return abstractVC;
}

- (MAbstractController *)popToCanvasWithArgument:(id)argumentData
{
    MAbstractController *abstractController = nil;
    NSUInteger nViewControllerCount = [self.navigationController.viewControllers count];
    if (nViewControllerCount >= 2)
    {
        MAbstractController *abstractController = [self.navigationController.viewControllers objectAtIndex:nViewControllerCount - 2];
        if (abstractController)
        {
            if ([abstractController respondsToSelector:@selector(argumentForCanvas:)])
            {
                if (argumentData)
                {
                    [abstractController argumentForCanvas:argumentData];
                }
            }
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    return abstractController;
}

- (void)argumentForCanvas:(id)argumentData
{
    
}
@end
