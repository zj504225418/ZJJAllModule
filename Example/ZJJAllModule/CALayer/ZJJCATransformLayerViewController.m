//
//  ZJJCATransformLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/11.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJCATransformLayerViewController.h"

@interface ZJJCATransformLayerViewController ()

@property (strong, nonatomic) CALayer *cube2;
@property (strong, nonatomic) UIBarButtonItem *barRightBarItem;


@end

@implementation ZJJCATransformLayerViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = self.barRightBarItem;

    self.view.backgroundColor = [UIColor blackColor];

    //set up the perspective transform(设置投影矩阵)
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.view.layer.sublayerTransform = pt;

    //set up the transform for cube 1 and add it
    CATransform3D c1t = CATransform3DIdentity;
    //左移100
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    //创建一个正方体
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.view.layer addSublayer:cube1];

    //创建第二个正方体
    CATransform3D c2t = CATransform3DIdentity;
    //右移100
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    //延x轴旋转45度
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    //延y轴旋转45度
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    //创建第二个正方体
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.view.layer addSublayer:cube2];
    self.cube2 = cube2;

}

static CGFloat hudu = M_PI_4 *0.2;

-(void)navRightBtnOnClick:(UIButton *)btn{

    [UIView animateWithDuration:3 delay:1 options:UIViewAnimationOptionAutoreverse animations:^{

        CATransform3D c2t = CATransform3DIdentity;
        c2t = CATransform3DTranslate(c2t, 100, 0, 0);
        //延x轴旋转45度
        c2t = CATransform3DRotate(c2t, -M_PI/2, 1, 0, 0);
        //延y轴旋转45度
        c2t = CATransform3DRotate(c2t, -M_PI/2, 0, 1, 0);
        self.cube2.transform = c2t;

    } completion:^(BOOL finished) {

        CATransform3D c2t = CATransform3DIdentity;
        c2t = CATransform3DTranslate(c2t, 100, 0, 0);
        //延x轴旋转45度
        c2t = CATransform3DRotate(c2t, -M_PI, 1, 0, 0);
        //延y轴旋转45度
        c2t = CATransform3DRotate(c2t, -M_PI, 0, 1, 0);
        self.cube2.transform = c2t;
    }];

}


- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    //正方体边长是100，为了让最原始面的中心跟CATransformLayer的中心在一起，所以坐标是-50，-50
    face.frame = CGRectMake(-50, -50, 100, 100);

    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];

    //add cube face 1、延z轴向外移50--最前面一个面
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 2、延z轴向里移动50，再选择y轴旋转90度---后面一个面
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 3、延x轴向右50，再延y轴旋转90度--右边一个面
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 4、延x轴向左移50，再延Y轴旋转90度---左边一个面
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 5、延y轴向下移50，再延x轴旋转90度---下面一个面
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //add cube face 6、延Y轴向上移50，再延x轴旋转90度---上面一个面
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];

    //center the cube layer within the container(将立方体层至于容器中心)
    CGSize containerSize = self.view.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);

    //apply the transform and return
    cube.transform = transform;

    return cube;
}


-(UIBarButtonItem *)barRightBarItem {
    if(!_barRightBarItem){

        UIButton * barRightBarItemBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];

        barRightBarItemBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [barRightBarItemBtn setTitle:@"变化" forState:UIControlStateNormal];
        [barRightBarItemBtn addTarget:self action:@selector(navRightBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        _barRightBarItem = [[UIBarButtonItem alloc]initWithCustomView:barRightBarItemBtn];

    }
    return _barRightBarItem;
}



@end
