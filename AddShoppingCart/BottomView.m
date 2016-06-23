
//
//  BottomView.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/13.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView
@synthesize bt_addBasket,bt_buyNow,bt_collection,bt_service,bt_shop;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bt_service= [UIButton buttonWithType:UIButtonTypeCustom];
        bt_service.frame = CGRectMake(0, 0,51, self.frame.size.height);
        [bt_service setBackgroundImage:[UIImage imageNamed:@"service"] forState:0];
        [self addSubview:bt_service];
        
        bt_shop= [UIButton buttonWithType:UIButtonTypeCustom];
        [bt_shop setBackgroundImage:[UIImage imageNamed:@"shop"] forState:0];
        bt_shop.frame = CGRectMake(bt_service.frame.size.width+bt_service.frame.origin.x, 0,53, self.frame.size.height);
        [self addSubview:bt_shop];

        
        bt_collection= [UIButton buttonWithType:UIButtonTypeCustom];
        bt_collection.frame = CGRectMake(bt_shop.frame.size.width+bt_shop.frame.origin.x, 0,52, self.frame.size.height);
        [bt_collection setBackgroundImage:[UIImage imageNamed:@"collection"] forState:0];
        [bt_collection setBackgroundImage:[UIImage imageNamed:@"collected"] forState:UIControlStateSelected];
        [self addSubview:bt_collection];

        
        bt_addBasket= [UIButton buttonWithType:UIButtonTypeCustom];
        bt_addBasket.frame = CGRectMake(bt_collection.frame.size.width+bt_collection.frame.origin.x, 0,109, self.frame.size.height);
        [bt_addBasket setBackgroundImage:[UIImage imageNamed:@"addbasket"] forState:0];
        [self addSubview:bt_addBasket];
        
        bt_buyNow= [UIButton buttonWithType:UIButtonTypeCustom];
        [bt_buyNow setBackgroundImage:[UIImage imageNamed:@"buynow"] forState:0];
        bt_buyNow.frame = CGRectMake(bt_addBasket.frame.size.width+bt_addBasket.frame.origin.x, 0,self.frame.size.width-(bt_addBasket.frame.size.width+bt_addBasket.frame.origin.x), self.frame.size.height);
        [self addSubview:bt_buyNow];
        

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
