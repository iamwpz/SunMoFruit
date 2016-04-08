//
//  GRBHomeHeadPageView.m
//  GuoRenBao
//
//  Created by LiYan on 15/12/9.
//  Copyright © 2015年 LiYan. All rights reserved.
//  创建者：李炎

#import "GRBHomeHeadPageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

// 图片的滚动的切换时间
#define kTimerDuration 2.5

@interface GRBHomeHeadPageView ()<UIScrollViewDelegate>

// 图片滚动视图
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// 页标
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


// 图片滚动定时器
@property (nonatomic,strong)NSTimer *pageTimer;

@end

@implementation GRBHomeHeadPageView

+(instancetype)pageViewWithFrame:(CGRect)frame{
    
    GRBHomeHeadPageView *pageView = [[[NSBundle mainBundle] loadNibNamed:@"GRBHomeHeadPageView" owner:nil options:nil] lastObject];
    pageView.frame = frame;
    [pageView setupUI];
    return pageView;
}

-(void)awakeFromNib{
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.delegate = self;
    // 打开定时器，图片开始滚动
    self.pageTimer = [NSTimer scheduledTimerWithTimeInterval:kTimerDuration target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}

// 更新视图
-(void)setupUI {
    // 设置滚动范围
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * self.urlArray.count, 0);
    self.scrollView.delegate = self;
    // 设置图片
    for (int i = 0; i < self.urlArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        
        
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.urlArray[i]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [[SDImageCache sharedImageCache] storeImage:image forKey:self.urlArray[i] toDisk:YES];
            
        }];
        
        [self.scrollView insertSubview:imageView atIndex:0];
    }
}

// 重写set方法，数据改变，更新UI
-(void)setUrlArray:(NSArray *)urlArray{
    
    _urlArray = urlArray;
    
    // 设置pageControl的点个数
    self.pageControl.numberOfPages = self.urlArray.count;
    // 更新UI
    [self setupUI];
}

// 翻页
-(void)scrollToNextPage {
    
    CGFloat nextOffset = self.scrollView.contentOffset.x + self.bounds.size.width;
    if (nextOffset == self.scrollView.contentSize.width) {
        nextOffset = 0;
    }
    [UIView animateWithDuration:0.5 animations:^{
        
        self.scrollView.contentOffset = CGPointMake(nextOffset, 0);
    }];
    [self setPageIndex];
}

// 刷新页号显示
- (void)setPageIndex {
    
    self.pageControl.currentPage = (self.scrollView.contentOffset.x / self.bounds.size.width);

}

// 重写 dealloc
-(void)dealloc{
    // 释放timer
    [self.pageTimer invalidate];
}

#pragma mark - scrollView 代理方法
// 停止拖动时，重新定义页脚
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setPageIndex];
    // 打开定时器，图片开始滚动
    self.pageTimer = [NSTimer scheduledTimerWithTimeInterval:kTimerDuration target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}
// 开始拖拽视图时，停止定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.pageTimer invalidate];
}
// 视图滚动减速停止时，再次刷新页号显示
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;{
    [self setPageIndex];
}

@end
