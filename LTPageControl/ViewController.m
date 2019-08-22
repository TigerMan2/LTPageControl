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

@interface ViewController () <LTPageControlDelegate>
@property (nonatomic, strong) LTPageControl *control;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LTPageControl *control = [[LTPageControl alloc] init];
    control.frame = CGRectMake(0, 100, 400, 30);
    control.backgroundColor = [UIColor redColor];
    control.dotColor = [UIColor greenColor];
    control.currentPage = 3;
    control.numberOfPages = 10;
    control.delegate = self;
    self.control = control;
    [self.view addSubview:control];
    
}

#pragma mark - LTPageControlDelegate

- (void)pageControl:(LTPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index {
    self.control.currentPage = index;
}

@end
