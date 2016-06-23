
//
//  GoodsDetailMainView.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/18.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "GoodsDetailMainView.h"

@implementation GoodsDetailMainView
@synthesize bottomView,goodsDetail,choseView;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor blackColor];
      
    }
    return self;
}
-(void)initBottomView
{
    bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-64-47, self.frame.size.width, 47)];
    [self addSubview:bottomView];
    [bottomView.bt_service addTarget:self action:@selector(seleteService) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_shop addTarget:self action:@selector(seleteShop) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_collection addTarget:self action:@selector(seleteCollection:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_addBasket addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.bt_buyNow addTarget:self action:@selector(seleteBuy) forControlEvents:UIControlEventTouchUpInside];
}
-(void)initDetailViewImgArr:(NSArray *)imgarr andWebArr:(NSArray *)webarr;
{

    goodsDetail = [[GoodsDetailView alloc] initWithFrame:CGRectMake(0, -64, self.frame.size.width, bottomView.frame.origin.y + 64) andImageArr:imgarr];
   
    [self addSubview:goodsDetail];
    //宝贝详情内容
    [goodsDetail initdata:[NSDictionary dictionary]];
    
    [goodsDetail.bt_addSize addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_judge addTarget:self action:@selector(goodsJudge) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_shop addTarget:self action:@selector(seleteShop) forControlEvents:UIControlEventTouchUpInside];
    [goodsDetail.bt_share addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    //图文详情webview的网址
    [goodsDetail initWebScro:webarr];
}
/**
 *  初始化弹出视图
 */
-(void)initChoseViewSizeArr:(NSArray *)sizeArr andColorArr:(NSArray *)colorArr andStockDic:(NSDictionary *)stockDic;
{
    //选择尺码颜色的视图
    choseView = [[ChoseView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    [self addSubview:choseView];
    [choseView.bt_cancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [choseView.bt_sure addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [choseView initTypeView:sizeArr :colorArr :stockDic];
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [choseView.alphaiView addGestureRecognizer:tap];
    
}
#pragma mark-bottom action
-(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
-(void)seleteService
{
    [self showAlert:@"点击客服"];
}
-(void)seleteShop
{
    [self showAlert:@"进入店铺"];
}
-(void)seleteCollection:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
        [self showAlert:@"取消收藏"];
    }else
    {
        btn.selected = YES;
        [self showAlert:@"已收藏"];
    }
}
-(void)seleteBuy
{
    [self showAlert:@"立即购买"];
}
#pragma mark-goosdetail action
-(void)share
{
    [self showAlert:@"分享"];
}
-(void)goodsJudge
{
    [self showAlert:@"宝贝评价"];
}
#pragma mark-action
/**
 *  点击按钮弹出
 */
-(void)show
{
    center = goodsDetail.center;
    center.y -= 64;
    
    [self.vc.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        
        goodsDetail.center = center;
        goodsDetail.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        
        choseView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion: nil];
    
    
}
/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    center.y += 64;
    [self.vc.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choseView.frame =CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
        goodsDetail.center = center;
        goodsDetail.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        goodsDetail.bt_addSize.headLabel.text = choseView.lb_detail.text;
    } completion: nil];
    
}
-(void)sure
{
    [self dismiss];
    [self showAlert:@"已经加入购物车"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
