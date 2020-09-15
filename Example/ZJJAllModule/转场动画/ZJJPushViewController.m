//
//  ZJJPushViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/9/14.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJPushViewController.h"
#import "ZJJPushTool.h"
#import "ZJJPopViewController.h"

@interface ZJJPushViewController ()<UINavigationControllerDelegate>

@end

@implementation ZJJPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor yellowColor];
}

//告诉nav，我想自己自定义一个转场
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPush) {

        //2.初始化自定义动画类
        ZJJPushTool *ct = [ZJJPushTool new];
        ct.isPush = YES;
        return ct;

    }else
    {
        return nil;
    }

    return nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    ZJJPopViewController *vc = [ZJJPopViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
