//
//  FBThreeDotsLoadingLayer.h
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FBLoadingLayer.h"

@interface FBThreeDotsLoadingLayer : FBLoadingLayer

+ (instancetype)loadingLayerWithFrame:(CGRect)frame;

+ (instancetype)loadingLayerWithFrame:(CGRect)frame dotsColor:(CGColorRef)dotsColor;

@end
