//
//  MHelp.h
//  Live
//
//  Created by Never on 2018/3/28.
//  Copyright © 2018年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Toast.h>
#import <Masonry.h>
#import <YYCategories.h>
#import <UIImageView+WebCache.h>

#pragma mark ----- 宏定义
/* 宽高 */
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
/* 通知中心 */
#define MNotificationCenter [NSNotificationCenter defaultCenter]
/* 随机色 */
#define MRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
/* 颜色 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
/* 主色调 */
#define MAINCOLOR     RGBA(211, 0, 0, 1.f)
/* 字体 */
#define FONT(f)       ([UIFont systemFontOfSize:f])
/* log */
#ifdef DEBUG
#define LOG(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define LOG(...)
#endif
/* 主屏 */
#define kWindow [UIApplication sharedApplication].keyWindow
/* Toast */
#define kToast(str)              CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:0.6 position:CSToastPositionCenter style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\


@interface MHelp : NSObject

@end
