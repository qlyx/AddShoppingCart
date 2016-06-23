
//
//  ImageScrollview.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/4/13.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ImageScrollview.h"

@implementation ImageScrollview
@synthesize pageControl;
-(instancetype)initWithFrame:(CGRect)frame andImageArr:(NSArray *)imageArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scro = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scro.contentSize = CGSizeMake(self.frame.size.width*imageArr.count, self.frame.size.height);
        self.scro.delegate = self;
        self.scro.showsHorizontalScrollIndicator = NO;
        self.scro.pagingEnabled = YES;
        [self addSubview:self.scro];
        for (int i = 0; i<imageArr.count; i++)
        {
            UIImageView *img = [[UIImageView alloc] init];
            img.image = [UIImage imageNamed:[imageArr objectAtIndex:i]];
            img.frame = CGRectMake(i*self.frame.size.width, 0,self.frame.size.width, self.frame.size.height);
            [self.scro addSubview:img];
        }

        pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        pageControl.numberOfPages = imageArr.count;
        pageControl.currentPage = 0;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"icon_ksss_on@3x" ofType:@"png"];
        pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:path]];
        path = [[NSBundle mainBundle] pathForResource:@"icon_ksss_off@3x" ofType:@"png"];
        pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:path]];
        [self addSubview:pageControl];
        pageControl.sd_layout.bottomSpaceToView(self,10).widthIs(150).heightIs(10).centerXEqualToView(self);

    }
    return self;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
        float contentOffsetX = scrollView.contentOffset.x;
        float width = scrollView.frame.size.width;
        float index = contentOffsetX/width;
        pageControl.currentPage = index;
        
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
