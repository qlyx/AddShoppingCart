//
//  GoodsDetailView.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/13.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScrollview.h"
#import "StrikeThroughLabel.h"
#import "MsButton.h"
#import "ImageWebview.h"
@interface GoodsDetailView : UIScrollView<ImageWebDelegete>
{
    ImageScrollview *goodsImgScro;
    
    UIImageView *img_TianMao;//天猫店铺图标
    UILabel *lb_goodsName;//商品名称
    
    UILabel *lb_price;//价格
    UILabel *lb_actitity;//促销活动
    StrikeThroughLabel *lb_oldPrice;//原价
    UILabel *lb_expressDelivery;//快递
    UILabel *lb_sales;//销量
    UILabel *lb_address;//地址
    
    
    
}
@property(nonatomic, retain)MsButton *bt_addSize;
@property(nonatomic, retain)MsButton *bt_judge;//评价
@property(nonatomic, retain)MsButton *bt_shop;//店铺信息
@property(nonatomic, retain)UIButton *bt_share;//分享按钮
@property(nonatomic, retain)ImageWebview *webscro;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr;
-(void)initWebScro:(NSArray *)webArr;
-(void)initdata:(NSDictionary *)dic;
@end
