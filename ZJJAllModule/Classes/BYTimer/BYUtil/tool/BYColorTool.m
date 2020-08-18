//
//  BYColorTool.m
//  credit
//
//  Created by xingxiang on 16/8/30.
//  Copyright © 2016年 baoyin. All rights reserved.
//

#import "BYColorTool.h"

@implementation BYColorTool

+ (UIColor *)colorWithRGB:(NSInteger)r g:(NSInteger)g b:(NSInteger)b
{
    return [BYColorTool colorWithRGBA:r g:g b:b a:1.0f];
}

+ (UIColor *)colorWithRGBA:(NSInteger)r g:(NSInteger)g b:(NSInteger)b a:(CGFloat)a
{
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

+ (UIColor *)colorWithHex:(NSInteger)hex
{
    
    return [BYColorTool colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha
{
    
    NSInteger r = (float)((hex & 0xFF0000) >> 16);
    NSInteger g = (float)((hex & 0xFF00) >> 8);
    NSInteger b = (float)(hex & 0xFF);
    return [BYColorTool colorWithRGBA:r g:g b:b a:alpha];
}

@end
