//
//  ViewController.m
//  LTPageControl
//
//  Created by Luther on 2019/8/21.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "LTPageControl.h"
#import "LTAnimatedDotView.h"
#import "LTExampleDotView.h"

@interface ViewController () <LTPageControlDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) LTPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setupUI];
    [self setImage];
}

- (void)setupUI {
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}

- (void)setImage {
    for (int i = 0; i < 6; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg",(i + 1)]]];
        imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, 253);
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 6, 0);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger pageIndex = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    self.pageControl.currentPage = pageIndex;
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 253)];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (LTPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[LTPageControl alloc] initWithFrame:CGRectMake(0, 353, [UIScreen mainScreen].bounds.size.width, 30)];
        _pageControl.dotColor = [UIColor greenColor];
//        _pageControl.dotViewClass = [LTExampleDotView class];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 6;
        _pageControl.delegate = self;
        _pageControl.dotImage = [UIImage imageNamed:@"dotInactive"];
        _pageControl.currentDotImage = [UIImage imageNamed:@"dotActive"];
    }
    return _pageControl;
}

@end
