//
//  UIViewController+scrollerHidden.h
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah--叶良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavBarHidden)

/** 需要监听的view */
@property (nonatomic,weak) UIScrollView * keyScrollView;

/** 设置导航条上的标签是否需要跟随滚动变化透明度,默认不会跟随滚动变化透明度 */
@property (nonatomic,assign) BOOL  isLeftAlpha;
@property (nonatomic,assign) BOOL  isTitleAlpha;
@property (nonatomic,assign) BOOL  isRightAlpha;

/** 清除默认导航条的背景设置 */
- (void)setInViewWillAppear;
- (void)setInViewWillDisappear;


/** 偏移offsetY的距离后,导航条的alpha为1 */
- (void)scrollControlByOffsetY:(CGFloat)offsetY;

@end