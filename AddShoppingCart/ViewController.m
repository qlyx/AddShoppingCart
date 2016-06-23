//
//  ViewController.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NavBarHidden.h"
#import "GoodsDetailMainView.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    
    
    GoodsDetailMainView *goodsMainview;
    NSArray *sizearr;//型号数组
    NSArray *colorarr;//分类数组
    NSDictionary *stockdic;//商品库存量
    int goodsStock;
    
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    /**
     这些数据应该从服务器获得 没有服务器我就只能先写死这些数据了
     */
    sizearr = [[NSArray alloc] initWithObjects:@"S",@"M",@"L",nil];
    colorarr = [[NSArray alloc] initWithObjects:@"蓝色",@"红色",@"湖蓝色",@"咖啡色",nil];
    NSString *str = [[NSBundle mainBundle] pathForResource: @"stock" ofType:@"plist"];
    stockdic = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:str]];
    
    //1.设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //2.设置导航条内容
    [self setUpNavBar];
    
    //3.导航条上的自定义的子标签是否需要跟着隐藏.
    self.isTitleAlpha = YES;
    // self.isLeftAlpha = YES;
    
    
    [self initview];
    
    
    
    
}
#pragma mark-method

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setInViewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self setInViewWillDisappear];
}


#pragma mark - UI设置


- (void)setUpNavBar{
    
    UILabel * titleLabel =[[UILabel alloc]init];
    titleLabel.text = @"商品详情";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    
}

-(void)initview
{
    self.view.backgroundColor = [UIColor blackColor];
    goodsMainview = [[GoodsDetailMainView alloc] initWithFrame:self.view.bounds];
    
    goodsMainview.vc = self;
    [self.view addSubview:goodsMainview];
    [goodsMainview initBottomView];
    [goodsMainview initDetailViewImgArr:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"] andWebArr:@[@"http://www.cocoachina.com",@"http://www.baidu.com",@"http://code.cocoachina.com"]];
    goodsMainview.goodsDetail.delegate = self;
    [goodsMainview initChoseViewSizeArr:sizearr andColorArr:colorarr andStockDic:stockdic];
    //5.告诉程序是根据哪个scrollView的滚动来控制状态栏的变化
    self.keyScrollView = goodsMainview.goodsDetail;
}

#warning 监听滚动,调用框架接口
#pragma mark-scro
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999
    if (scrollView == goodsMainview.goodsDetail) {
        [self scrollControlByOffsetY:200];
        
    }
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%f",goodsMainview.goodsDetail.contentOffset.y);
    if(scrollView == goodsMainview.goodsDetail)
    {
        if (goodsMainview.goodsDetail.contentOffset.y>170) {
            [UIView animateWithDuration: 0.25 animations: ^{
                goodsMainview.goodsDetail.contentSize = CGSizeMake(goodsMainview.frame.size.width, goodsMainview.goodsDetail.webscro.frame.size.height+goodsMainview.goodsDetail.webscro.frame.origin.y);
                
                goodsMainview.goodsDetail.contentOffset =CGPointMake(0, goodsMainview.goodsDetail.webscro.frame.origin.y-64) ;
                goodsMainview.goodsDetail.scrollEnabled = NO;
                
            } completion: nil];
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
