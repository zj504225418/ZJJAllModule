//
//  BYColorTool.h
//  credit
//
//  Created by xingxiang on 16/8/30.
//  Copyright © 2016年 baoyin. All rights reserved.
//
//  颜色工具

#import <Foundation/Foundation.h>

@interface BYColorTool : NSObject

/**
 *  根据给定的RGB获得UIColor
 *
 *  @param r 红
 *  @param g 绿
 *  @param b 蓝
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithRGB:(NSInteger)r g:(NSInteger)g b:(NSInteger)b;

/**
 *  根据给定的RGBA获得UIColor
 *
 *  @param r 红
 *  @param g 绿
 *  @param b 蓝
 *  @param a 透明
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithRGBA:(NSInteger)r g:(NSInteger)g b:(NSInteger)b a:(CGFloat)a;

/**
 *  根据给定的16进制获得UIColor
 *
 *  @param hex 16进制数
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(NSInteger)hex;

/**
 *  根据指定的16进制数和透明度获得UIColor
 *
 *  @param hex   16进制数
 *  @param alpha 透明
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

@end
