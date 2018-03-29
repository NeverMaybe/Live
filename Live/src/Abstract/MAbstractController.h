//
//  MAbstractController.h
//  Live
//
//  Created by Never on 2018/3/26.
//  Copyright © 2018年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAbstractController : UIViewController
/**
 传递到当前视图数据
 
 @param argumentData argumentData
 */
- (void)argumentForCanvas:(id)argumentData;

/**
 设置导航栏左按钮
 */
- (void)setLeftNavigationItem;


/**
 设置左右图片UINavigationItem
 
 @param leftImage 左边要显示的图片
 @param rightImage 右边要显示的图片
 */
- (void)setImageLeftNavigationItem:(UIImage *)leftImage andRightImage:(UIImage *)rightImage;

/**
 设置导航栏标题
 
 @param title titleName
 */
- (void)setNavigationTitle:(NSString *)title;

/**
 push下一级
 
 @param canvasName 控制器类名
 @param argumentData 给下一级传递的数据
 @return 类型
 */
- (MAbstractController *)pushCanvas:(NSString *) canvasName withArgument:(id)argumentData;

/**
 pop上一级
 
 @param argumentData 给上一级传递参数
 @return 类型
 */
- (MAbstractController *)popToCanvasWithArgument:(id)argumentData;
@end
