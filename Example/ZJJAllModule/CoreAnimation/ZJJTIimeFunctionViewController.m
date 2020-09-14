//
//  ZJJTIimeFunctionViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/31.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJTIimeFunctionViewController.h"

@interface ZJJTIimeFunctionViewController ()<CAAnimationDelegate>

@property(nonatomic,strong)CALayer *colorLayer;

@property (strong, nonatomic) UIView *colorView;

@end

@implementation ZJJTIimeFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100, 100, 100, 100);
    self.colorLayer.position = CGPointMake(kWindowWidth/2, kWindowHeight/2);
    self.colorLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];

    self.colorView = [UIView new];
    self.colorView.frame = CGRectMake(100, 100, 100, 100);
    self.colorView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.colorView];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self testTransaction:touches];
//    [self testViewAnimation:touches];
//    [self tesetKeyframeAnimation];
    [self testAnimation];

}

-(void)testTransaction:(NSSet<UITouch *> *)touches{
    //CATransaction动画只对单独的layer有效
    [CATransaction begin];
    [CATransaction setAnimationDuration:1];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:@"easeInEaseOut"]];
    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
    //CATransaction动画只对单独的layer有效
    self.colorView.layer.position = [[touches anyObject] locationInView:self.view];
    [CATransaction commit];
}

-(void)testViewAnimation:(NSSet<UITouch *> *)touches{

//    UIView动画对view有效，对layer是匀速移动，没有速度缓冲效果
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.colorView.layer.position = [[touches anyObject] locationInView:self.view];
        self.colorLayer.position = [[touches anyObject] locationInView:self.view];
    } completion:^(BOOL finished) {

    }];
}

-(void)tesetKeyframeAnimation{

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 4;
    animation.values = @[(__bridge id)[UIColor yellowColor].CGColor,
    (__bridge id)[UIColor orangeColor].CGColor,
    (__bridge id)[UIColor redColor].CGColor,
    (__bridge id)[UIColor blueColor].CGColor,
    (__bridge id)[UIColor lightGrayColor].CGColor];
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:@"easeIn"];
    /*CAKeyframeAnimation有一个 NSArray类型的 timingFunctions属性，
     我们可以用它来对每次动画的步骤指定不同的计时函数。
     但是指定函数的个数一定要等于keyframes数组的元素个数减一，
     因为它是描述每一帧之间动画速度的函数。*/
    animation.timingFunctions = @[fn];
    [self.colorLayer addAnimation:animation forKey:nil];
}

-(void)testAnimation{

    self.colorLayer.position = CGPointMake(150, 600);

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1;
    animation.delegate = self;

    NSMutableArray *valueArray = [NSMutableArray array];
    NSMutableArray *timeArray = [NSMutableArray array];
    for (int i = 15; i > 0; i--) {
        NSLog(@"%d",i);
        NSValue *value = [NSValue valueWithCGPoint:CGPointMake(150, 300+i*10)];
        [valueArray addObject:value];

        CAMediaTimingFunction *mediaTimingFunction = [CAMediaTimingFunction functionWithName:@"easeOut"];
        [timeArray addObject:mediaTimingFunction];
    }
    animation.values = valueArray;

    [timeArray removeLastObject];
    animation.timingFunctions = timeArray;
    animation.keyTimes = @[@0.0,@0.2,@0.3,@0.4,@0.45,@0.5,@0.6,@0.65,@0.7,@0.8,@0.9];
//    self.colorLayer.position = CGPointMake(150, 300);
    [self.colorLayer addAnimation:animation forKey:nil];

}


@end
