//
//  ZJJPopViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/9/14.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJPopViewController.h"
#import "ZJJPushTool.h"

@interface ZJJPopViewController ()<UINavigationControllerDelegate>

@end

@implementation ZJJPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

   self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor orangeColor];
}
//告诉nav，我想自己自定义一个转场
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPop) {

        //2.初始化自定义动画类
        ZJJPushTool *ct = [ZJJPushTool new];
        ct.isPush = NO;
        return ct;

    }else
    {
        return nil;
    }

    return nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.navigationController popViewControllerAnimated:YES];
}
@end
