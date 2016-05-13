//
//  FBPendulumsLoadingLayer.m
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "FBPendulumsLoadingLayer.h"
#import <UIKit/UIKit.h>

@implementation FBPendulumsLoadingLayer

+ (instancetype)loadingLayerWithFrame:(CGRect)frame ballsCount:(NSUInteger)ballsCount
{
    NSAssert(ballsCount >= 2, @"balls count should be greater than 1.");
    FBPendulumsLoadingLayer *layer = [[FBPendulumsLoadingLayer alloc] init];
    layer.frame = frame;
    layer.backgroundColor = [UIColor grayColor].CGColor;
    
    CGFloat ballsSize = [self defaultBallsSize];
    CGFloat firstBallX = frame.size.width / 2 - (ballsCount / 2.0) * ballsSize;
    CGFloat firstBallY = frame.size.height / 2 - ballsSize / 2;
    for (int i = 0; i < ballsCount; i++) {
        CALayer *ball = [[CALayer alloc] init];
        ball.backgroundColor = [UIColor blackColor].CGColor;
        ball.frame = CGRectMake(firstBallX + ballsSize * i, firstBallY, ballsSize, ballsSize);
        ball.cornerRadius = ballsSize / 2;
        [layer addSublayer:ball];
        if (i == 0) {
            [layer addFirstBallAnimation:ball];
            continue;
        }
        if (i == ballsCount - 1) {
            [layer addLastBallAnimation:ball];
        }
    }
    
    return layer;
}

static const CGFloat airTime = 0.4f;

- (void)addFirstBallAnimation:(CALayer *)firstBall
{
    CGFloat ropeLength = self.frame.size.height / 4;
    CGPoint arcCenter = CGPointMake(firstBall.frame.origin.x + firstBall.frame.size.width / 2, self.frame.size.height / 2 - ropeLength);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:ropeLength startAngle:M_PI * 5 / 6 endAngle:M_PI_2 clockwise:0];
    animation.path = path.CGPath;
    animation.duration = airTime;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2 * airTime;
    group.repeatCount = HUGE;
    group.autoreverses = YES;
    group.animations = @[animation];
    
    [firstBall addAnimation:group forKey:nil];
}

- (void)addLastBallAnimation:(CALayer *)lastBall
{
    CGFloat ropeLength = self.frame.size.height / 4;
    CGPoint arcCenter = CGPointMake(lastBall.frame.origin.x + lastBall.frame.size.width / 2, self.frame.size.height / 2 - ropeLength);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:ropeLength startAngle:M_PI_2 endAngle:M_PI / 6 clockwise:0];
    animation.path = path.CGPath;
    animation.duration = airTime;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
        animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.beginTime = CACurrentMediaTime() + airTime;
    group.duration = 4 * airTime;
    group.repeatCount = HUGE;
    group.animations = @[animation];
    
    [lastBall addAnimation:group forKey:nil];
}

+ (CGFloat)defaultBallsSize
{
    return 15;
}

@end
