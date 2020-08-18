//
//  ZJJTransform3DViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/8.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJTransform3DViewController.h"

@interface ZJJTransform3DViewController ()

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

@property (strong, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) IBOutlet UIView *view4;
@property (strong, nonatomic) IBOutlet UIView *view5;
@property (strong, nonatomic) IBOutlet UIView *view6;
@property (strong, nonatomic) UIView *containerView;

@property(nonatomic,strong)NSArray *faces;

@end

@implementation ZJJTransform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.containerView = [[UIView alloc]init];
    self.containerView.frame = CGRectMake(30, 100, 300, 300);
    self.containerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.containerView];

    self.faces = @[self.view1,self.view2,self.view3,self.view4,self.view5,self.view6];

    //父视图的layer图层
    CATransform3D perspective = CATransform3DIdentity;
    //设置为透视视图
    perspective.m34 = -1/500;
    //延x轴旋转45度
    perspective = CATransform3DRotate(perspective, M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, M_PI_4, 0, 1, 0);

    self.containerView.layer.sublayerTransform = perspective;

    CGFloat juli = 100;
    //添加第一个视图,让第一个视图沿z轴平移100
    CATransform3D transform1 = CATransform3DMakeTranslation(0, 0, juli);
    [self addFace:self.faces[0] transform:transform1];
    //添加第二个面,研x轴平移100，并且研Y轴旋转90度,使用make可以让transform更新，而不使用make的api会让效果叠加
    transform1 = CATransform3DMakeTranslation(juli, 0, 0);
    transform1 = CATransform3DRotate(transform1, M_PI_2, 0, 1, 0);
    [self addFace:self.faces[1] transform:transform1];

    //第三个面
    transform1 = CATransform3DMakeTranslation(0, -100, 0);
    transform1 = CATransform3DRotate(transform1, M_PI_2, 1, 0, 0);
    [self addFace:self.faces[2] transform:transform1];

    //第四个面
    transform1 = CATransform3DMakeTranslation(0, 100, 0);
    transform1 = CATransform3DRotate(transform1, -M_PI_2, 1, 0, 0);
    [self addFace:self.faces[3] transform:transform1];

    //第五个面
    transform1 = CATransform3DMakeTranslation(-100, 0,0);
    transform1 = CATransform3DRotate(transform1, -M_PI_2, 0, 1, 0);
    [self addFace:self.faces[4] transform:transform1];

    //第六个面
    transform1 = CATransform3DMakeTranslation(0, 0, -100);
    transform1 = CATransform3DRotate(transform1, M_PI, 0, 1, 0);
    [self addFace:self.faces[5] transform:transform1];

}



//将正方体的六个面都添加尽量，并做相应的旋转
-(void)addFace:(UIView *)view transform:(CATransform3D)transform{

    [self.containerView addSubview:view];

    CGSize containerSize = self.view.frame.size;
    view.center = CGPointMake(containerSize.width/2, containerSize.height/2);
    view.layer.transform = transform;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
