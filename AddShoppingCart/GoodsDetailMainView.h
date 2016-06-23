//
//  GoodsDetailMainView.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/18.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsDetailView.h"
#import "BottomView.h"
#import "ChoseView.h"
#import "ViewController.h"
@interface GoodsDetailMainView : UIView<UITextFieldDelegate>
{
    CGPoint center;
}
@property(nonatomic, retain)GoodsDetailView *goodsDetail;//详情页所需对象
@property(nonatomic, retain)BottomView *bottomView;;
@property(nonatomic, retain)ChoseView *choseView;//尺寸选择所需对象
@property(nonatomic, weak)ViewController *vc;
-(void)initChoseViewSizeArr:(NSArray *)sizeArr andColorArr:(NSArray *)colorArr andStockDic:(NSDictionary *)stockDic;
-(void)initDetailViewImgArr:(NSArray *)imgarr andWebArr:(NSArray *)webarr;
-(void)initBottomView;
@end
