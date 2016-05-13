//
//  ViewController.m
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "ViewController.h"
#import "FBLoadingLayer.h"
#import "FBPendulumsLoadingLayer.h"

@interface ViewController ()

@property (nonatomic) CALayer *aLayer;
@property (nonatomic) UIView *aView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] init];
    [button addTarget:self action:@selector(trigger) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"trigger" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 30, 100, 50);
    [self.view addSubview:button];
}

- (void)trigger
{
    [self addALoadingLogo];
}

- (void)addALoadingLogo
{
//    [self.view.layer addSublayer:[FBLoadingLayer loadingLayerWithType:FBThreeDotsLoadingLayerType frame:CGRectMake(150, 150, 200, 200)]];
    [self.view.layer addSublayer:[FBPendulumsLoadingLayer loadingLayerWithFrame:CGRectMake(150, 150, 200, 200) ballsCount:5]];
}

@end
