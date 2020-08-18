//
//  ZJJHitTestView.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/7.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJHitTestView.h"

@implementation ZJJHitTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
point:在view的局部坐标系中的点
 event：系统保证调用此方法的事件

 return：如果此视图包含这个点，则返回自己，如果处理不了就会返回父view，如果返回nil则把事件丢弃

 hit test调用顺序：
 touch --- UIApplication  UIWindow   UIViewController   UIView   subView...合适的view

事件的传递顺序刚好与之相反：

 常见UIView不响应事件的处理有哪些：

 1、隐藏
 2、userInteractionEnabled=NO
 3、透明度< 0.05
 4、view超过父view

 */
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    if(self.userInteractionEnabled == NO||
       self.alpha < 0.05||
       self.hidden == YES){
        return nil;
    }
    //如果点击地方在self的bounds内
    if([self pointInside:point withEvent:event]){

        for(UIView *subView in self.subviews){
            //进行坐标转换
            CGPoint coverPoint = [subView convertPoint:point toView:self];
            //调用子视hitTest 图的hitTest重复上面步骤，找到了，返回hitTest view，没找到返回自身处理
            UIView *hitTestView = [subView hitTest:coverPoint withEvent:event];

            if(hitTestView){
                return hitTestView;
            }
        }
        return nil;
    }

    return self;
}

@end
