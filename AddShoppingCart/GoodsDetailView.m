
//
//  GoodsDetailView.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/13.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "GoodsDetailView.h"

@implementation GoodsDetailView
@synthesize bt_addSize,bt_judge,webscro,bt_shop,bt_share;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 470)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        goodsImgScro = [[ImageScrollview alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 300) andImageArr:imageArr];
        [view addSubview:goodsImgScro];
        
        bt_share = [[UIButton alloc] initWithFrame:CGRectZero];
        [bt_share setBackgroundImage:[UIImage imageNamed:@"share"] forState:0];
        //[bt_share addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:bt_share];
        bt_share.sd_layout.rightSpaceToView(view,0).heightIs(40).widthIs(58).topSpaceToView(goodsImgScro,10);
        
        lb_goodsName = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_goodsName.textColor = [UIColor blackColor];
        lb_goodsName.font = [UIFont systemFontOfSize:18];
        lb_goodsName.numberOfLines = 2;
        [view addSubview:lb_goodsName];
        lb_goodsName.sd_layout.topSpaceToView(goodsImgScro,10).leftSpaceToView(view,10).rightSpaceToView(bt_share,10).heightIs(45);
        
        img_TianMao = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tianmao"]];
        [view addSubview:img_TianMao];
        img_TianMao.sd_layout.topSpaceToView(goodsImgScro,12).leftEqualToView(lb_goodsName).heightIs(18).widthIs(21);
     
        lb_price = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_price.textColor = [UIColor colorWithRed:244/255.0 green:56/255.0  blue:11/255.0  alpha:1];
        lb_price.font = [UIFont systemFontOfSize:30];
        [view addSubview:lb_price];
        lb_price.sd_layout.topSpaceToView(lb_goodsName,10).leftSpaceToView(view,10).heightIs(40).widthIs(100);
        
        lb_actitity = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_actitity.textColor = [UIColor whiteColor];
        lb_actitity.backgroundColor = [UIColor colorWithRed:244/255.0 green:56/255.0  blue:11/255.0  alpha:1];
        lb_actitity.textAlignment = NSTextAlignmentCenter;
        lb_actitity.font = [UIFont systemFontOfSize:10];
        [view addSubview:lb_actitity];
        lb_actitity.sd_layout.topSpaceToView(lb_goodsName,22).leftSpaceToView(lb_price,10).heightIs(16).widthIs(100);
        
        lb_oldPrice = [[StrikeThroughLabel alloc] initWithFrame:CGRectZero];
        lb_oldPrice.textColor = [UIColor lightGrayColor];
        lb_oldPrice.font = [UIFont systemFontOfSize:14];
        [view addSubview:lb_oldPrice];
        lb_oldPrice.sd_layout.topSpaceToView(lb_price,10).leftSpaceToView(view,10).heightIs(20).widthIs(20);
        
        lb_expressDelivery = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_expressDelivery.textColor = [UIColor lightGrayColor];
        lb_expressDelivery.font = [UIFont systemFontOfSize:14];
        [view addSubview:lb_expressDelivery];
        lb_expressDelivery.sd_layout.topSpaceToView(lb_oldPrice,10).leftSpaceToView(view,10).heightIs(20).widthIs(100);
        
        lb_sales = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_sales.textColor = [UIColor lightGrayColor];
        lb_sales.textAlignment = NSTextAlignmentCenter;
        lb_sales.font = [UIFont systemFontOfSize:14];
        [view addSubview:lb_sales];
        lb_sales.sd_layout.topSpaceToView(lb_oldPrice,10).centerXEqualToView(view).heightIs(20).widthIs(100);
        
        lb_address = [[UILabel alloc] initWithFrame:CGRectZero];
        lb_address.textColor = [UIColor lightGrayColor];
        lb_address.textAlignment = NSTextAlignmentRight;
        lb_address.font = [UIFont systemFontOfSize:14];
        [view addSubview:lb_address];
        lb_address.sd_layout.topSpaceToView(lb_oldPrice,10).rightSpaceToView(view,10).heightIs(20).widthIs(100);
        
        //尺码选择
        bt_addSize = [[MsButton alloc] initWithFrame:CGRectMake(0, view.frame.size.height+10, self.frame.size.width, 50) Head:nil Message:nil];
        bt_addSize.msgLabel.frame = CGRectMake(0, bt_addSize.frame.size.height-1, bt_addSize.frame.size.width, 1);
        bt_addSize.msgLabel.backgroundColor = [UIColor lightGrayColor];
        
        bt_addSize.headLabel.frame = CGRectMake(10, 0, bt_addSize.frame.size.width -50, bt_addSize.frame.size.height);
        bt_addSize.backgroundColor = [UIColor whiteColor];
        bt_addSize.jiantou.image = [UIImage imageNamed:@"set_ico_r@3x"];
        bt_addSize.jiantou.frame = CGRectMake(bt_addSize.frame.size.width-15, (bt_addSize.frame.size.height-16)/2, 10, 16);
        [self addSubview:bt_addSize];
        //评价
        bt_judge = [[MsButton alloc] initWithFrame:CGRectMake(0, bt_addSize.frame.size.height+bt_addSize.frame.origin.y+10, self.frame.size.width, 50) Head:nil Message:nil];
        bt_judge.msgLabel.frame = CGRectMake(0, bt_judge.frame.size.height-1, bt_judge.frame.size.width, 1);
        bt_judge.msgLabel.backgroundColor = [UIColor lightGrayColor];
        
        bt_judge.headLabel.frame = CGRectMake(10, 0, bt_judge.frame.size.width -50, bt_judge.frame.size.height);
        bt_judge.backgroundColor = [UIColor whiteColor];
        bt_judge.jiantou.image = [UIImage imageNamed:@"set_ico_r@3x"];
        bt_judge.jiantou.frame = CGRectMake(bt_judge.frame.size.width-15, (bt_judge.frame.size.height-16)/2, 10, 16);
        [self addSubview:bt_judge];
        //店铺
        bt_shop = [[MsButton alloc] initWithFrame:CGRectMake(0, bt_judge.frame.size.height+bt_judge.frame.origin.y+10, self.frame.size.width, 100) Head:nil Message:nil];
        bt_shop.msgLabel.frame = CGRectMake(100, 50, bt_shop.frame.size.width-120, 30);
        bt_shop.msgLabel.textAlignment = NSTextAlignmentLeft;
        bt_shop.msgLabel.textColor = [UIColor redColor];
        bt_shop.msgLabel.font = [UIFont systemFontOfSize:12];
        bt_shop.headLabel.frame = CGRectMake(100, 20, bt_shop.frame.size.width -120,30);
        bt_shop.backgroundColor = [UIColor whiteColor];
        bt_shop.jiantou.frame = CGRectMake(20, 20, 60, 60);
        [self addSubview:bt_shop];
        
      
        [self inittips];
      
        
    }
    return self;
}
-(void)initWebScro:(NSArray *)webArr
{
    webscro = [[ImageWebview alloc] initWithFrame:CGRectMake(0, bt_shop.frame.size.height+bt_shop.frame.origin.y+50, self.frame.size.width, self.frame.size.height-64) andwebArr:webArr];
    webscro.delegate = self;
    [self addSubview:webscro];
}
-(void)inittips
{
    UILabel *lb_leftline = [[UILabel alloc] initWithFrame:CGRectMake(10, bt_shop.frame.size.height+bt_shop.frame.origin.y+20, 100, 0.5)];
    lb_leftline.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lb_leftline];
    
    UILabel *lb_rightline = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-110, bt_shop.frame.size.height+bt_shop.frame.origin.y+20, 100, 0.5)];
    lb_rightline.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lb_rightline];
    
    UILabel *lb_tips = [[UILabel alloc] initWithFrame:CGRectMake(lb_leftline.frame.origin.x+lb_leftline.frame.size.width, bt_shop.frame.size.height+bt_shop.frame.origin.y+10, lb_rightline.frame.origin.x-(lb_leftline.frame.origin.x+lb_leftline.frame.size.width), 20)];
    lb_tips.textAlignment = NSTextAlignmentCenter;
    lb_tips.font = [UIFont systemFontOfSize:12];
    lb_tips.backgroundColor = [UIColor clearColor];
    lb_tips.text = @"继续拖动查看图文详情";
    [self addSubview:lb_tips];
    self.contentSize = CGSizeMake(self.frame.size.width, lb_tips.frame.origin.y+lb_tips.frame.size.height+64);
}
-(void)initdata:(NSDictionary *)dic
{
    //传进来的字典里面包含以下信息
    BOOL isTianMao = 1;//是否是天猫店铺 是的话就要显示天猫图标
    BOOL isActivity = 1;//是否有促销活动
    if (isTianMao) {
        img_TianMao.hidden = NO;
        lb_goodsName.text = @"      2016春装新款长袖小西装外套女韩版修身荷叶边短款糖果色小西服潮";
    }else
    {
        img_TianMao.hidden = YES;
        lb_goodsName.text = @"2016春装新款长袖小西装外套女韩版修身荷叶边短款糖果色小西服潮";
    }
    
    lb_price.text = @"¥ 33 ";
    NSDictionary *fontdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:30],NSFontAttributeName, nil];
    CGSize size = [lb_price.text sizeWithAttributes:fontdic];
    lb_price.sd_layout.widthIs(size.width);
    
    if (isActivity) {
        lb_actitity.text = @"踏青囤货价";
        fontdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil];
        size = [lb_actitity.text sizeWithAttributes:fontdic];
        lb_actitity.sd_layout.widthIs(size.width+5).leftSpaceToView(lb_price,10);
    }
    
    lb_oldPrice.text = @"价格:50";
    lb_oldPrice.strikeThroughEnabled = YES;
    fontdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil];
    size = [lb_oldPrice.text sizeWithAttributes:fontdic];
    lb_oldPrice.sd_layout.widthIs(size.width);
    
    lb_expressDelivery.text = @"快递:00";
    lb_sales.text = @"月销量9520笔";
    lb_address.text = @"湖南 益阳";
    
    bt_addSize.headLabel.text = @"选择 颜色 尺码";
    bt_judge.headLabel.text = @"宝贝评价(10022)";
    
    bt_shop.jiantou.image = [UIImage imageNamed:@"1.jpg"];
    bt_shop.headLabel.text = @"彩黛妃旗舰店";
    bt_shop.msgLabel.text = @"天猫 TIANMAO.COM";
    
}
#pragma -imageweb
- (void)dragWebview
{
    
    CGPoint point = self.contentOffset;
    [UIView animateWithDuration: 0.25 animations: ^{
        self.contentOffset = CGPointMake(0, point.y-webscro.frame.size.height);
        self.contentSize = CGSizeMake(self.frame.size.width,webscro.frame.origin.y+64);
        self.scrollEnabled = YES;
    } completion: nil];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
