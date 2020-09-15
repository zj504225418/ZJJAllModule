//
//  ZJJTransitionTool.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/9/14.
//  Copyright © 2020 zj504225418. All rights reserved.
//  创建CATransition动画工具类

#import "ZJJTransitionTool.h"

@implementation ZJJTransitionTool

/// 给layer添加动画
/// @param layer 添加动画的layer
/// @param animationTime 动画时间
/// @param animationType 动画类型
/// @param animationFrom 动画方向
+(CATransition *)zjj_addLayerAnimationWithLayer:(CALayer *)layer animationTime:(NSTimeInterval)animationTime animationType:(ZJJLayerAnimationType)animationType animationFrom:(ZJJAnimationFrom)animationFrom{

    //定义subType类型
    NSString *animationTypeString = nil;
    NSString *subTypeString = nil;

    switch (animationFrom) {
        case AnimationFromLeft:
            subTypeString = kCATransitionFromLeft;
            break;
        case AnimationBottom:
            subTypeString = kCATransitionFromBottom;
            break;
        case AnimationRight:
            subTypeString = kCATransitionFromRight;
            break;
        case AnimationTop:
            subTypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }

    //定义animationType
    switch (animationType) {
        case Fade:
            animationTypeString = kCATransitionFade;
            break;

        case Push:
            animationTypeString = kCATransitionPush;
            break;

        case Reveal:
            animationTypeString = kCATransitionReveal;
            break;

        case MoveIn:
            animationTypeString = kCATransitionMoveIn;
            break;

        case Cube:
            animationTypeString = @"cube";
            break;

        case SuckEffect:
            animationTypeString = @"suckEffect";
            break;

        case OglFlip:
            animationTypeString = @"oglFlip";
            break;

        case RippleEffect:
            animationTypeString = @"rippleEffect";
            break;

        case PageCurl:
            animationTypeString = @"pageCurl";
            break;

        case PageUnCurl:
            animationTypeString = @"pageUnCurl";
            break;

        case CameraIrisHollowOpen:
            animationTypeString = @"cameraIrisHollowOpen";
            break;

        case CameraIrisHollowClose:
            animationTypeString = @"cameraIrisHollowClose";
            break;

        default:
            break;
    }

    //创建CATransition对象
    CATransition *animation = [[CATransition alloc]init];
    //设置运动时间
    animation.duration = animationTime;
    //设置运动类型
    animation.type = animationTypeString;
    if (subTypeString != nil) {
        animation.subtype = subTypeString;
    }
    //给View添加animation
//    [layer addAnimation:animation forKey:@"animation"];
    return animation;
}

/// 给view添加动画
/// @param view 添加动画的view
/// @param animationTime 动画时间
/// @param animationType 动画类型
/// @param complate 结束后的回调
+(void)zjj_addViewAnimationWithView:(UIView *)view
                      animationTime:(NSTimeInterval)animationTime
                      animationType:(ZJJViewAnimationType)animationType
                         complate:(void (^)(void))complate{

    UIViewAnimationTransition transitionType;

    switch (animationType) {
        case CurlDown:
            transitionType = UIViewAnimationTransitionCurlDown;
            break;
        case CurlUp:
            transitionType = UIViewAnimationTransitionCurlUp;
            break;
        case FlipFromLeft:
            transitionType = UIViewAnimationTransitionFlipFromLeft;
            break;
        case FlipFromRight:
            transitionType = UIViewAnimationTransitionFlipFromRight;
            break;
        default:
            break;
    }

    [UIView animateWithDuration:animationTime animations:^{

        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transitionType forView:view cache:YES];

        if (complate) {
            complate();
        }
    }];
}



@end
