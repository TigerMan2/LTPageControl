//
//  LTExampleDotView.m
//  LTPageControl
//
//  Created by Luther on 2019/8/25.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTExampleDotView.h"

@implementation LTExampleDotView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.backgroundColor = [UIColor redColor];
}

- (void)changeActivityState:(BOOL)active {
    if (active) {
        [self animatedToActiveState];
    } else {
        [self animatedToDeactiveState];
    }
}

- (void)animatedToActiveState {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor yellowColor];
        self.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.4, 1.4), CGAffineTransformMakeRotation(M_PI));
    } completion:nil];
}

- (void)animatedToDeactiveState {
    
    self.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor redColor];
    } completion:nil];
}

@end
