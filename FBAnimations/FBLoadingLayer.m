//
//  FBLoadingLayer.m
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "FBLoadingLayer.h"
#import "FBThreeDotsLoadingLayer.h"

@implementation FBLoadingLayer

+ (instancetype)loadingLayerWithType:(FBLoadingLayerType)type frame:(CGRect)frame
{
    switch (type) {
        case FBThreeDotsLoadingLayerType:
            return [FBThreeDotsLoadingLayer loadingLayerWithFrame:frame];
        default:
            break;
    }
}
   
@end
