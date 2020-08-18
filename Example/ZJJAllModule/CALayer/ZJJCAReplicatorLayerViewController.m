//
//  ZJJCAReplicatorLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/12.
//  Copyright © 2020 zj504225418. All rights reserved.
//  多图层layer

#import "ZJJCAReplicatorLayerViewController.h"
#import "ZJJReflectionView.h"

@interface ZJJCAReplicatorLayerViewController ()

@end

@implementation ZJJCAReplicatorLayerViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"多图层layer";
    [self testReflection1];
}

-(void)testReflection1{

    ZJJReflectionView *view = [[ZJJReflectionView alloc]initWithFrame:CGRectMake(50, 200, 100, 100)];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:view.bounds];
    imageView.image = [UIImage imageNamed:@"AppIcon60x60"];
    [view addSubview:imageView];

//    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
//    layer.frame = imageView.bounds;
//    [view.layer addSublayer:imageView.layer];
//
//    layer.instanceCount = 2;
//
//    CATransform3D transform = CATransform3DIdentity;
//    //间隔
//    CGFloat veticalOffset = imageView.bounds.size.height + 2;
//    transform = CATransform3DTranslate(transform, 0, veticalOffset, 0);
//    transform = CATransform3DScale(transform, -1, -1, 0);
//    layer.instanceTransform = transform;
//
//    //K-0.7= 0.3
//    layer.instanceAlphaOffset = -0.7;
//
//    CALayer *layer1 = [CALayer layer];
//    layer1.frame = imageView.bounds;
//    UIImage *image = [UIImage imageNamed:@"AppIcon1024"];
//    //    contents：需要用__bridge id桥接一下MAC OS遗留的问题
//    layer.contents = (__bridge id)image.CGImage;
//    [layer addSublayer:layer1];

}

/// 测试一个10个子图层一次变换
-(void)testReplicator{

        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 500)];
        subView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:subView];

        //create a replicator layer and add it to our view
        CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
        replicator.frame = subView.bounds;
        replicator.backgroundColor = [UIColor blueColor].CGColor;
        [subView.layer addSublayer:replicator];

        //复制replicator上子图层的个数
        replicator.instanceCount = 10;
        //apply a transform for each instance
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, 0, 20, 0);
        transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
        transform = CATransform3DTranslate(transform, 0, -20, 0);

        //每个子图层都会依照上一个图层完成transform的转换
        replicator.instanceTransform = transform;

       //apply a color shift for each instance
        //为每个实例应用颜色偏移
        replicator.instanceBlueOffset = -0.1;
        replicator.instanceGreenOffset = -0.1;

        //create a sublayer and place it inside the replicator
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(100, 100.0f, 50, 50);
        layer.backgroundColor = [UIColor orangeColor].CGColor;
        [replicator addSublayer:layer];
}


@end
