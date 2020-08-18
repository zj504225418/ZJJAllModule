//
//  UIButton+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIButton+BYHelper.h"
#import "UIImage+BYHelper.h"
#import "BYColorAndFont.h"



@implementation UIButton (BYHelper)
//创建button
+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title{
    return [UIButton by_buttonWithFrame:frame bgColor:bgColor textColor:color font:font title:title target:nil action:NULL];
}
+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title target:(id)target action:(SEL)btnAction{
    return [UIButton by_buttonWithFrame:frame bgColor:bgColor textColor:color font:font title:title boardColor:[UIColor clearColor] cornerRadius:0 target:target action:btnAction];
}

+ (id)by_buttonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner target:(id)target action:(SEL)btnAction{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = bgColor;
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.borderColor = bcolor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = corner;
    [btn addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
}

//创建button  设置背景图片
+ (id)by_buttonWithFrame:(CGRect)frame normalBgImage:(UIImage *)normalBgImage disabledBgImage:(UIImage *)disabledBgImage highlightBgImage:(UIImage *)highlightBgImage textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title{
    return [UIButton by_buttonWithFrame:frame normalBgImage:normalBgImage disabledBgImage:disabledBgImage highlightBgImage:highlightBgImage textColor:color font:font title:title target:nil action:NULL];
}
+ (id)by_buttonWithFrame:(CGRect)frame normalBgImage:(UIImage *)normalBgImage disabledBgImage:(UIImage *)disabledBgImage highlightBgImage:(UIImage *)highlightBgImage textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title target:(id)target action:(SEL)btnAction{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setBackgroundImage:normalBgImage forState:UIControlStateNormal];
    [btn setBackgroundImage:disabledBgImage forState:UIControlStateDisabled];
    [btn setBackgroundImage:highlightBgImage forState:UIControlStateHighlighted];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


//创建button  项目中常用的颜色渐变button
+ (id)by_buttonWithFrame:(CGRect)frame title:(NSString *)title{
    
    return [UIButton by_buttonWithFrame:frame title:title target:nil action:NULL];
}

+ (id)by_buttonWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)btnAction{
    UIImage *normalImage = [UIImage by_imageWithStartColor:UIColorFromRGB(0xFE9540) withEndColor:UIColorFromRGB(0xFA5E40) withSize:frame.size sideCircle:YES basedOnScale:YES];
    
    UIImage *disabledImage = [UIImage by_imageWithColor:UIColorFromRGB(0xdddddd) withSize:frame.size sideCircle:YES basedOnScale:YES];
    
    return [UIButton by_buttonWithFrame:frame normalBgImage:normalImage disabledBgImage:disabledImage highlightBgImage:nil textColor:UIColorFromRGB(0xffffff) font:BY_Font(18) title:title target:target action:btnAction];
}
@end
