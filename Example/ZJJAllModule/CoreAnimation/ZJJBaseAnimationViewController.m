//
//  ZJJBaseAnimationViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/18.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJBaseAnimationViewController.h"

@interface ZJJBaseAnimationViewController ()<CAAnimationDelegate>

@property (weak, nonatomic)  CALayer *layer1;

@property (weak, nonatomic)  UIView *view1;

@property (weak, nonatomic)  CALayer *layer3;

@end

@implementation ZJJBaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubView];
}

-(void)addSubView{

    for (int i = 0; i < 3; i++) {
        CGFloat height = 50;
        CGFloat bianju = 50;
        CGFloat wight = (kWindowWidth - bianju *4)/3;

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50 + (bianju + wight)*i, 150, wight, height);
        [btn setTitle:[NSString stringWithFormat:@"按钮%d",i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        [btn addTarget:self action:@selector(clcickbutton:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.view addSubview:btn];

        switch (i) {
            case 0:{

                CALayer *view = [CALayer layer];
                view.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                view.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view.layer addSublayer:view];
                self.layer1 = view;

            }
                break;
            case 1:
            {
                UIView *view = [UIView new];
                view.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                view.layer.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view addSubview:view];
                self.view1 = view;
            }

                break;
            case 2:{

                CALayer *layer = [CALayer layer];
                layer.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                layer.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view.layer addSublayer:layer];
                self.layer3 = layer;

                CATransition *transition = [CATransition animation];
                transition.type = kCATransitionPush;
                transition.subtype = kCATransitionFromLeft;
                layer.actions = @{@"backgroundColor":transition};

            }

                break;

            default:
                break;
        }
    }
}

-(void)clcickbutton:(UIButton *)btn{

    switch (btn.tag) {
        case 0:
            [self testBasicAnimation];
            break;
        case 1:
            [self testKeyframeAnimation];
            break;
        case 2:
//            [self testCGPathKeyFrameAnimation];
            [self testAnimationGroup];
            break;
        default:
            break;
    }

}

-(void)testBasicAnimation{

    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"backgroundColor";
    basicAnimation.toValue = (__bridge id)[UIColor redColor].CGColor;
    basicAnimation.delegate = self;
    basicAnimation.duration = 1;
    [basicAnimation setValue:@"123" forKey:@"123"];
    [self.view.layer addAnimation:basicAnimation forKey:@"123"];
    NSLog(@"basicAnimation:%@",basicAnimation);
}

/// 动画结束后的代理方法
/// @param anim 动画对象
/// @param flag 是否完成
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //这个地方跟上面的basicAnimation不是同一个对象，是深拷贝过来的
    CAAnimation *an = [self.layer1 animationForKey:@"123"];
    NSArray *arr = [self.layer1 animationKeys];
    NSString *str = [anim valueForKey:@"123"];
    NSLog(@"anim:%@  ---  %@ --- %@ -- %@ -- %@",anim,an,arr,self.layer1,str);
    //打印:anim:<CABasicAnimation: 0x600003020c80>  ---  (null) --- (null) -- <CALayer: 0x600003024a00> -- 123

    //这样就有两个动画了
    [CATransaction begin];
//    [CATransaction setDisableActions:true];
    [CATransaction setAnimationDuration:2];
//    self.layer1.backgroundColor = (__bridge CGColorRef)anim.toValue;
    self.layer1.backgroundColor = [UIColor orangeColor].CGColor;
    [CATransaction commit];
}

-(void)testKeyframeAnimation{

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor];
    [self.layer1 addAnimation:animation forKey:nil];
}

/// 路径动画
-(void)testCGPathKeyFrameAnimation{

    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, kWindowHeight/2)];
    [bezierPath addCurveToPoint:CGPointMake(300, kWindowHeight/2) controlPoint1:CGPointMake(200, kWindowHeight/2 + 100) controlPoint2:CGPointMake(150, 50)];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3;
    [self.view.layer addSublayer:pathLayer];

    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, kWindowHeight/2);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"AppIcon60x60"].CGImage;
    [self.view.layer addSublayer:shipLayer];

    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 4;
    keyAnimation.path = bezierPath.CGPath;
    /*
     kCAAnimationRotateAuto:中心线跟path在一条线上
     kCAAnimationRotateAutoReverse:物体反过来做动画
     如果不设置，只保证中心点在轨迹上
     */
    keyAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    [shipLayer addAnimation:keyAnimation forKey:nil];
}

-(void)testTransform{

//    CATransformLayer *layer = [CATransformLayer layer];
//    layer.transform

}

/// 动画组
-(void)testAnimationGroup{

    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, kWindowHeight/2)];
    [path addCurveToPoint:CGPointMake(300, kWindowHeight/2) controlPoint1:CGPointMake(200, 200) controlPoint2:CGPointMake(150, 150)];
    //画上路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth = 2;
    [self.view.layer addSublayer:shapeLayer];
    //创建移动对象
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 50, 50);
    layer.position = CGPointMake(0, kWindowHeight/2);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:layer];

    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.path = path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;

    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"backgroundColor";
    basicAnimation.toValue = (__bridge id)[UIColor blackColor].CGColor;

    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyAnimation,basicAnimation];
    groupAnimation.duration = 4;
    //是否原路返回，YES：原路动画返回，NO:动画结束后直接回到原点
    groupAnimation.autoreverses = NO;
    [layer addAnimation:groupAnimation forKey:nil];

}

/// 过渡动画
-(void)testTransition{

    
}


@end
