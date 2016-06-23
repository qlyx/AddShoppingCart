//
//  MsButton.h
//  NanKaiCircle
//
//  Created by YanShuJ on 14-5-29.
//  Copyright (c) 2014年 XianTe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsButton : UIButton

@property (nonatomic ,strong) UILabel *headLabel;
@property (nonatomic ,strong) UILabel *msgLabel;
@property(nonatomic, retain)UIImageView *jiantou;
- (id)initWithFrame:(CGRect)frame Head:(NSString *)head Message:(NSString *)msg;
@end
