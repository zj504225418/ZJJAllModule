//
//  UIView+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BYHelper)

//创建line
+ (id)by_lineViewWith:(CGFloat)value isVertical:(BOOL)b withColor:(UIColor *)color;

/**
 *  给View切圆角
 *
 *  @param radius 圆角大小
 */
-(void)by_makeRation:(CGFloat)radius;

/**
 *  给View变成圆形
 */
-(void)by_makeRound;


//添加点击事件，点击执行block
- (void)by_setClickBlock:(void(^)(void))block;
@end
