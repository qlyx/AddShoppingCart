//
//  ImageScrollview.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/13.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollview : UIView<UIScrollViewDelegate>
@property(nonatomic, retain)UIScrollView *scro;
@property(nonatomic, retain)UIPageControl *pageControl;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
@end
