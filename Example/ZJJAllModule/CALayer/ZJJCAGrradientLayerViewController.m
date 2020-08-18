//
//  ZJJCAGrradientLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/12.
//  Copyright © 2020 zj504225418. All rights reserved.
//  渐变色

#import "ZJJCAGrradientLayerViewController.h"

@interface ZJJCAGrradientLayerViewController ()

@end

@implementation ZJJCAGrradientLayerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(10, 50, self.view.frame.size.width - 20, 300);
    /*这些浮点数定义了 colors属性中每个不同颜色的位 置
    locations数组并不是强制要求的，但是如果你给它赋值了就一定要确保locations的数组大小和 colors数组大小一定要相同，否则你将会得到一个 空白的渐变*/
    gradientLayer.locations = @[@0.0,@0.25,@0.5,@0.75,@1];

    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor,
                             (__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor purpleColor].CGColor];

    //左上角的位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    //右下角的位置
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];
}



@end
