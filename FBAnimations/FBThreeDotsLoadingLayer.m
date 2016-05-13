//
//  FBThreeDotsLoadingLayer.m
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "FBThreeDotsLoadingLayer.h"
#import <UIKit/UIKit.h>


@implementation FBThreeDotsLoadingLayer

+ (instancetype)loadingLayerWithFrame:(CGRect)frame
{
    return [self loadingLayerWithFrame:frame dotsColor:[self defaultDotsColor]];
}

+ (instancetype)loadingLayerWithFrame:(CGRect)frame dotsColor:(CGColorRef)dotsColor
{
    FBThreeDotsLoadingLayer *layer = [[FBThreeDotsLoadingLayer alloc] init];
    layer.frame = frame;
    
    CGFloat dotsMaximumSize = [self defaultMaximumDotsSize];
    CGFloat dotsMinimumSize = [self defaultMinimumDotsSize];
    CGFloat dotsDistance = [self defaultDotsDistance];
    CGFloat firstDotX = frame.size.width / 2 - 1.5 * dotsMaximumSize - dotsDistance;
    CGFloat firstDotY = frame.size.height / 2 - dotsMaximumSize / 2;
    for (int i = 0; i < 3; i++) {
        CALayer *dot = [[CALayer alloc] init];
        dot.backgroundColor = dotsColor;
        dot.frame = CGRectMake(firstDotX + i * (dotsMaximumSize + dotsDistance), firstDotY, dotsMinimumSize, dotsMinimumSize);
        dot.cornerRadius = dotsMinimumSize / 2;
        [self addAnimationToDot:dot beginTime:0.25 * i];
        [layer addSublayer:dot];
    }
    
    return layer;
}

+ (void)addAnimationToDot:(CALayer *)dot beginTime:(CFTimeInterval)beginTime
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size"];
    animation.keyTimes = @[@0, @0.7, @1];
    NSValue *maxSizeValue = [NSValue valueWithCGSize:CGSizeMake([self defaultMaximumDotsSize], [self defaultMaximumDotsSize])];
    NSValue *minSizeValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    animation.values = @[maxSizeValue, minSizeValue, maxSizeValue];
    animation.duration = 0.8f;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = false;
    animation.beginTime = beginTime;
    
    [dot addAnimation:animation forKey:nil];
    
    CAKeyframeAnimation *radiusAnimation = [CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
    radiusAnimation.keyTimes = @[@0, @0.7, @1];
    CGFloat min = [self defaultMinimumDotsSize] / 2;
    CGFloat max = [self defaultMaximumDotsSize] / 2;
    radiusAnimation.values = @[@(max), @(min), @(max)];
    radiusAnimation.duration = 0.8f;
    radiusAnimation.repeatCount = HUGE;
    radiusAnimation.removedOnCompletion = false;
    radiusAnimation.beginTime = beginTime;
    
    [dot addAnimation:radiusAnimation forKey:nil];
}

+ (CGColorRef)defaultDotsColor
{
    return [UIColor blackColor].CGColor;
}

+ (CGFloat)defaultMaximumDotsSize
{
    return 10;
}

+ (CGFloat)defaultMinimumDotsSize
{
    return 2;
}

+ (CGFloat)defaultDotsDistance
{
    return 10;
}

@end
