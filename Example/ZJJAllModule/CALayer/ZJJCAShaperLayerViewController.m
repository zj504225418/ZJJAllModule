//
//  ZJJCAShaperLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/9.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJCAShaperLayerViewController.h"

@interface ZJJCAShaperLayerViewController ()

@end

@implementation ZJJCAShaperLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testShapeLayer];

}

-(void)testShapeLayer{
        UIBezierPath *path = [[UIBezierPath alloc]init];
        [path moveToPoint:CGPointMake(175, 100)];
        //画一个小人
        /*
         画一个圆，也就是小人头，其中各个参数意思
         圆心
         半径
         开始的角度
         旋转的角度
         是否
         */
        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    //    开始点移到圆的最下面
        [path moveToPoint:CGPointMake(150, 125)];
        //脖子和身子
        [path addLineToPoint:CGPointMake(150, 175)];
        //左腿
        [path addLineToPoint:CGPointMake(125, 225)];
        //回到屁股地方
        [path moveToPoint:CGPointMake(150, 175)];
        //右腿
        [path addLineToPoint:CGPointMake(175, 225)];
        //移到左手处
        [path moveToPoint:CGPointMake(100, 150)];
        //画上左手和右手
        [path addLineToPoint:CGPointMake(200, 150)];

        //画一个长方形
        CGRect rect = CGRectMake(50, 250, 100, 100);
        //圆角弧度，弧度大小按照width来的？？？？？？？
        CGSize radii = CGSizeMake(10, 10);
        //弧度在左上角和右上角
        UIRectCorner corners1 = UIRectCornerTopLeft | UIRectCornerTopRight|UIRectCornerBottomLeft | UIRectCornerBottomRight;
        //弧度在左下角和右下角
        UIRectCorner corners2 = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners1 cornerRadii:radii];

        //1、创建CAShaperLayer
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        //笔画颜色
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        //填充颜色
        shapeLayer.fillColor = [UIColor blueColor].CGColor;
        //线段宽度
        shapeLayer.lineWidth = 5;
        //线条之间的结合点的样子
        shapeLayer.lineJoin = kCALineJoinRound;
        //线条结尾的样子
        shapeLayer.lineCap = kCALineCapRound;
        //绘制图形路径
        shapeLayer.path = path2.CGPath;
        [self.view.layer addSublayer:shapeLayer];
}



@end
