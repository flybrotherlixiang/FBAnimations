//
//  ViewController.m
//  FBAnimations
//
//  Created by 李翔 on 5/13/16.
//  Copyright © 2016 Xiang Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addALoadingLogo
{
    CALayer *aLayer = [[CALayer alloc] init];
    
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"path";
    animation.fromValue = 
}

@end
