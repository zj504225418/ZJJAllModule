//
//  ZJJTransitionViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/25.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJTransitionViewController.h"

@interface ZJJTransitionViewController ()

@property(nonatomic,strong)NSArray *images;

@property (weak, nonatomic) UIImageView *imageView;

@property (weak, nonatomic) CALayer *doorLayer;

@end

@implementation ZJJTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(50, 200, 100, 100);
    [self.view addSubview:imageView];
    self.imageView = imageView;

    self.images = @[@"spark_blue",@"spark_red",@"spark_yellow"];

    [self testRepeatCount];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];

     [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGFloat x = [pan translationInView:self.view].x;
    x /= 200.0f;
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    //暂停动画后，通过手势来控制layer的位置
    self.doorLayer.timeOffset = timeOffset;
    [pan setTranslation:CGPointZero inView:self.view];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    if (self.doorLayer.speed == 0) {
//        self.doorLayer.speed = 1;
//
//    }else{
//        //暂停动画，暂停后，layer变成最开始样子，恢复动画后，layer会从暂停的位置开始动画
//        self.doorLayer.speed = 0;
//
//    }
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;//动画类型
//    transition.subtype = kCATransitionFromTop;//动画推出的方向
//    transition.repeatCount = INFINITY;//动画重复的次数
//    transition.duration = 1;//动画执行的时间
//    [self.imageView.layer addAnimation:transition forKey:nil];
//
//    NSInteger index = random()%self.images.count;
//    UIImage *image = BY_IMAGE(self.images[index]);
//    self.imageView.image = image;

    //UIView提供的动画，延中心轴旋转
//    [UIView transitionWithView:self.imageView duration:1.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
//        NSInteger index = random()%self.images.count;
//        UIImage *image = BY_IMAGE(self.images[index]);
//        self.imageView.image = image;
//    } completion:^(BOOL finished) {
//
//    }];

}

/// 循环动画，实现门摇动效果
-(void)testRepeatCount{

    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 100, 100);
    doorLayer.position = CGPointMake(100, 300);
    doorLayer.anchorPoint = CGPointMake(0, 0.8);
    doorLayer.backgroundColor = [UIColor yellowColor].CGColor;
    doorLayer.contents = (__bridge id)[UIImage imageNamed:@"AppIcon60x60"].CGImage;
    doorLayer.speed = 1;
//    doorLayer.beginTime = 0.5;
    doorLayer.timeOffset = 0.5;

    [self.view.layer addSublayer:doorLayer];
    self.doorLayer = doorLayer;

    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1/500;
    self.view.layer.sublayerTransform = perspective;

    CABasicAnimation *animation = [CABasicAnimation animation];
    //动画的方向
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI);//角度
    animation.duration = 1.0;//动画时间
    animation.repeatCount = 1000;//循环次数
    animation.autoreverses = true;//一次动画完成后是否动画恢复原样
    /*开始时间，延迟时间---这个属性一设置就没动画了*/
//     animation.beginTime = 0.3;
//     animation.removedOnCompletion = NO;
//     animation.fillMode = kCAFillModeRemoved;
    //动画的速度，速度为2，原来设置2秒的动画，现在只需要1秒
//    animation.speed = 2;
    /*timeOffset 和 beginTime 类似，
     但是和增加beginTime导致的延迟动画不同，
     增加timeOffset只是让动画快进到某一点，
     例如，对于一个持续1秒的动画来说,设置timeOffset为0.5意味着动画将从一半的地方开始，并且会按照循环的情况走完整个动画时间
     */
//    animation.timeOffset = 0.5;
    [doorLayer addAnimation:animation forKey:nil];
}

@end
