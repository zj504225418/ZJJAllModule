//
//  ZJJTransitionTool.h
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/9/14.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose      //关镜头

} ZJJLayerAnimationType;

typedef enum : NSUInteger {
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转

} ZJJViewAnimationType;

typedef enum : NSUInteger {
    AnimationFromLeft = 1,                   //从左边出来
    AnimationBottom,                       //从下边出来
    AnimationRight,                     //从右边出来
    AnimationTop,                     //从上边出来

} ZJJAnimationFrom;

@interface ZJJTransitionTool : NSObject

/// 给layer添加动画
/// @param layer 添加动画的layer
/// @param animationTime 动画时间
/// @param animationType 动画类型
/// @param animationFrom 动画方向
+(CATransition *)zjj_addLayerAnimationWithLayer:(CALayer *)layer animationTime:(NSTimeInterval)animationTime animationType:(ZJJLayerAnimationType)animationType animationFrom:(ZJJAnimationFrom)animationFrom;

/// 给view添加动画
/// @param view 添加动画的view
/// @param animationTime 动画时间
/// @param animationType 动画类型
/// @param complate 结束后的回调
+(void)zjj_addViewAnimationWithView:(UIView *)view
                      animationTime:(NSTimeInterval)animationTime
                      animationType:(ZJJViewAnimationType)animationType
                           complate:(void (^)(void))complate;

@end

NS_ASSUME_NONNULL_END
