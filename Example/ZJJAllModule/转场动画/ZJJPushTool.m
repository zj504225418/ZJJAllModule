//
//  ZJJPushTool.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/9/14.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJPushTool.h"
#import "ZJJTransitionTool.h"

@interface ZJJPushTool()<CAAnimationDelegate>

@property(nonatomic,strong)id<UIViewControllerContextTransitioning> context;

@end

@implementation ZJJPushTool

//1.定义转场动画时长
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .8;

}

//2.定义转场动画内容
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //1.动画是基于上下文的,首先自定义一个上下文
    _context = transitionContext;

    //2.获取View的容器(通过上下文获取)containerView在其中进行动画转换的视图。
    // The view in which the animated transition should take place.
    UIView *containerView = [transitionContext containerView];

    /*
     UITransitionContextToViewControllerKey : 跳转到那个界面
     UITransitionContextFromViewControllerKey:从哪个界面跳转
     */

    //5.添加动画
    UIViewController *VC1;
    UIViewController *VC2;
    VC1 = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    VC2 = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:VC1.view];
    [containerView addSubview:VC2.view];

    ZJJAnimationFrom from = AnimationRight;
    if (_isPush) {
        from = AnimationFromLeft;
    }

//    CATransition *transition = [ZJJTransitionTool zjj_addLayerAnimationWithLayer:containerView.layer animationTime:[self transitionDuration:transitionContext] animationType:Cube animationFrom:from];
//    transition.delegate = self;
//    [containerView.layer addAnimation:transition forKey:@"animation"];

    [ZJJTransitionTool zjj_addViewAnimationWithView:containerView animationTime:[self transitionDuration:transitionContext] animationType:FlipFromRight complate:^{

        [_context completeTransition:YES];
    }];

}
#pragma mark -- animationDelegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_context completeTransition:YES];

    //    if (_isPush) {
//        //取消蒙板
//        UIViewController *toVC = [_context viewControllerForKey:UITransitionContextToViewControllerKey];
//        toVC.view.layer.mask = nil;
//        [self.sdflayer removeFromSuperlayer];
//    }else{
//        //取消蒙板
//        UIViewController *toVC = [_context viewControllerForKey:UITransitionContextFromViewControllerKey];
//        toVC.view.layer.mask = nil;
//        [self.sdflayer removeFromSuperlayer];
//
//    }
}

@end
