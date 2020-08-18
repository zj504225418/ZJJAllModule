//
//  ZJJCAEmitterLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/12.
//  Copyright © 2020 zj504225418. All rights reserved.
//  粒子效果

#import "ZJJCAEmitterLayerViewController.h"

@interface ZJJCAEmitterLayerViewController ()

@property (nonatomic, strong) CAEmitterLayer * colorBallLayer;


@end

@implementation ZJJCAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self testEmitter];
//    [self setupEmitter];


}

- (void)setupEmitter{

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    [self.view addSubview:label];
    label.textColor = [UIColor whiteColor];
    label.text = @"轻点或拖动来改变发射源位置";
    label.textAlignment = NSTextAlignmentCenter;

    // 1. 设置CAEmitterLayer
    CAEmitterLayer * colorBallLayer = [CAEmitterLayer layer];
    [self.view.layer addSublayer:colorBallLayer];
    self.colorBallLayer = colorBallLayer;

    //发射源的尺寸大小
    colorBallLayer.emitterSize = self.view.frame.size;
    //发射源的形状
    colorBallLayer.emitterShape = kCAEmitterLayerPoint;
    //发射模式
    colorBallLayer.emitterMode = kCAEmitterLayerLine;
    //粒子发射形状的中心点
    colorBallLayer.emitterPosition = CGPointMake(self.view.layer.bounds.size.width, 0.f);

    // 2. 配置CAEmitterCell
    CAEmitterCell * colorBallCell = [CAEmitterCell emitterCell];
    //粒子名称
    colorBallCell.name = @"colorBallCell";
    //粒子产生率,默认为0
    colorBallCell.birthRate = 20.f;
    //粒子生命周期
    colorBallCell.lifetime = 10.f;
    //粒子速度,默认为0
    colorBallCell.velocity = 40.f;
    //粒子速度平均量
    colorBallCell.velocityRange = 100.f;
    //x,y,z方向上的加速度分量,三者默认都是0
    colorBallCell.yAcceleration = 15.f;
    //指定纬度,纬度角代表了在x-z轴平面坐标系中与x轴之间的夹角，默认0:
    colorBallCell.emissionLongitude = M_PI; // 向左
    //发射角度范围,默认0，以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内;
    colorBallCell.emissionRange = M_PI_4; // 围绕X轴向左90度
    // 缩放比例, 默认是1
    colorBallCell.scale = 0.2;
    // 缩放比例范围,默认是0
    colorBallCell.scaleRange = 0.1;
    // 在生命周期内的缩放速度,默认是0
    colorBallCell.scaleSpeed = 0.02;
    // 粒子的内容，为CGImageRef的对象
    colorBallCell.contents = (id)[[UIImage imageNamed:@"circle_white"] CGImage];
    //颜色
    colorBallCell.color = [[UIColor colorWithRed:0.5 green:0.f blue:0.5 alpha:1.f] CGColor];
    // 粒子颜色red,green,blue,alpha能改变的范围,默认0
    colorBallCell.redRange = 1.f;
    colorBallCell.greenRange = 1.f;
    colorBallCell.alphaRange = 0.8;
    // 粒子颜色red,green,blue,alpha在生命周期内的改变速度,默认都是0
    colorBallCell.blueSpeed = 1.f;
    colorBallCell.alphaSpeed = -0.1f;

    // 添加
    colorBallLayer.emitterCells = @[colorBallCell];
}

-(void)testEmitter{

    //设置emitterLayer
    CAEmitterLayer *emitterLyer = [CAEmitterLayer layer];
    [self.view.layer addSublayer:emitterLyer];
    self.colorBallLayer = emitterLyer;

    //发射源尺寸
    emitterLyer.emitterSize = self.view.frame.size;
    //发射源形状
    emitterLyer.emitterShape = kCAEmitterLayerPoint;
    //发射模式
    emitterLyer.emitterMode = kCAEmitterLayerSurface;
    //粒子发射形状的中心点
    emitterLyer.emitterPosition = CGPointMake(self.view.layer.bounds.size.width/2,-300.f);
//    是否将3D例子系统平面化到一个图层(默认值)或者可 以在3D空间中混合其他的图层
    emitterLyer.preservesDepth = YES;
    /*
     控制着在视觉上粒子图片是如何混合的。
     你可能已经注意到 了示例中我们把它设置为 kCAEmitterLayerAdditive ，
     它实现了这样一个效果:合并例子重叠部分的亮度使得看上去更亮。
     如果我们把它设置为默认的 kCAEmitterLayerUnordered，效果就没那么好看了
     */
    emitterLyer.renderMode = kCAEmitterLayerAdditive;


    //配置CAEmitterCell
    CAEmitterCell *colorBallCell = [CAEmitterCell emitterCell];
    //粒子的名字，自定义
    colorBallCell.name = @"colorBallCell";
    //粒子产生率，默认为0，代表每秒产生多少个粒子
    colorBallCell.birthRate = 50.f;
    //粒子生命周期，单位是秒，粒子从产生到消亡的时间
    colorBallCell.lifetime = 15.f;
    //粒子速度，默认为0
    colorBallCell.velocity = 50.f;
    //粒子速度平均量
    colorBallCell.velocityRange = 1.f;
    //x、y、z方向上的加速度分量,三者默认都是0
    colorBallCell.yAcceleration = 15.f;
//    colorBallCell.xAcceleration = -10;
//    colorBallCell.zAcceleration = 15;
    //指定维度，维度角代表了在x-z轴平面坐标系中与x轴之间的夹角，默认为0
    colorBallCell.emissionLongitude = M_PI;//向左
//    //指定经度
    colorBallCell.emissionLatitude = M_PI;
 /*发射角度范围，默认是0，
  以锥形分布开的发射角度，角度用弧度制，粒子均匀分布在这个锥形范围
  设置为2*π就是粒子可以从任意方向弹射出来
  */
    colorBallCell.emissionRange = M_PI*2;
//    //缩放比例，默认是1
    colorBallCell.scale = 0.1;
//    //缩放比例范围，默认是0
    colorBallCell.scaleRange = 1;
//在生命周期内的缩放速度，默认是0；粒子产生后的放大速度，值越大，放大越快
    colorBallCell.scaleSpeed = 0.5;
//    //粒子的内容，为CGImageRef的对象
    colorBallCell.contents = (id)[UIImage imageNamed:@"AppIcon29x29"].CGImage;
//    //颜色，覆盖在粒子上面的颜色
    colorBallCell.color = [UIColor orangeColor].CGColor;
//    //粒子颜色red,green,blue,alpha能改变的范围,默认0
    colorBallCell.redRange = 1;
    colorBallCell.blueRange = 1;
    colorBallCell.greenRange = 1.f;
    colorBallCell.alphaRange = 0.8;
/*粒子颜色red,green,blue,alpha在生命周期内的改变速度,默认都是0
 如果alphaSpeed设置为-0.4，就是说粒子的透明度每过一秒就是减少0.4，
 这样就有发射出去之后逐渐小时的效果
*/
    colorBallCell.redSpeed = -0.1;
    colorBallCell.blueSpeed = -0.2;
    colorBallCell.greenSpeed = -0.2f;
    colorBallCell.alphaSpeed = -0.1f;
    //添加
    emitterLyer.emitterCells = @[colorBallCell];

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint point = [self locationFromTouchEvent:event];
    [self setBallInPsition:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [self locationFromTouchEvent:event];
    [self setBallInPsition:point];
}

-(CGPoint)locationFromTouchEvent:(UIEvent *)event{

    UITouch *touch = [[event allTouches] anyObject];
    return [touch locationInView:self.view];
}

-(void)setBallInPsition:(CGPoint)position{

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"emitterCells.colorBallCell.scale"];
    animation.fromValue = @0.2;
    animation.toValue = @0.5;
    animation.duration = 1;
    //线性起搏，使动画在其持续时间内均匀地发生
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //用事务包装隐式动画
    [CATransaction begin];
    //设置是否禁止由于该事务组内的属性更改
    [CATransaction setDisableActions:YES];
    //为colorBallLayer添加动画
    [self.colorBallLayer addAnimation:animation forKey:nil];
    //为colorBallLayer指定位置添加动画效果.,粒子发射形状新的中心点
    [self.colorBallLayer setValue:[NSValue valueWithCGPoint:position] forKeyPath:@"emitterPosition"];
    //提交动画
    [CATransaction commit];

}

@end
