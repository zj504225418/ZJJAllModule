//
//  UIButton+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickCallBack)(UIButton *button);

@interface UIButton (BYHelper)
//创建button  设置背景颜色
+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title;
+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title target:(id)target action:(SEL)btnAction;
+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner target:(id)target action:(SEL)btnAction;


//创建button  设置背景图片
+ (id)by_buttonWithFrame:(CGRect)frame normalBgImage:(UIImage *)normalBgImage disabledBgImage:(UIImage *)disabledBgImage highlightBgImage:(UIImage *)highlightBgImage textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title;

+ (id)by_buttonWithFrame:(CGRect)frame normalBgImage:(UIImage *)normalBgImage disabledBgImage:(UIImage *)disabledBgImage highlightBgImage:(UIImage *)highlightBgImage textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title target:(id)target action:(SEL)btnAction;


//创建button  项目中常用的颜色渐变button
+ (id)by_buttonWithFrame:(CGRect)frame title:(NSString *)title;
+ (id)by_buttonWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)btnAction;
@end
