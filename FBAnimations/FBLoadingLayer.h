//
//  FBLoadingLayer.h
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "FBAnimationLayer.h"

typedef enum : NSUInteger {
    FBThreeDotsLoadingLayerType,
} FBLoadingLayerType;


@interface FBLoadingLayer : FBAnimationLayer

+ (instancetype)loadingLayerWithType:(FBLoadingLayerType)type frame:(CGRect)frame;

@end
