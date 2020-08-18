//
//  UILabel+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UILabel+BYHelper.h"

@implementation UILabel (BYHelper)
//创建label
+ (id)by_labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment{
    return [self by_labelWithTextColor:color font:font textAlignment:alignment text:nil];
}
+ (id)by_labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text{
    UILabel *label = [[[self class] alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    label.text = text;
    [label sizeToFit];
    return label;
}

//修改label的属性
- (void)by_setTextColor:(UIColor *)color font:(UIFont *)font text:(NSString *)text{
    [self by_setTextColor:color font:font textAlignment:NSTextAlignmentCenter text:text];
}
- (void)by_setTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment{
    [self by_setTextColor:color font:font textAlignment:alignment text:nil];
}
- (void)by_setTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text{
    
    self.backgroundColor = [UIColor clearColor];
    self.textColor = color;
    self.font = font;
    self.textAlignment = alignment;
    self.text = text;
    [self sizeToFit];
}

//设置字符串中指定字符串的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor contentString:(NSString *)contentString
{
    if (!contentString.length) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:contentString];
    
    if (range.location != NSNotFound)
    {
        [self by_setTextColor:textColor range:range];
    }
}

- (void)by_setFont:(UIFont *)font contentString:(NSString *)contentString
{
    
    if (!contentString.length) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:contentString];
    
    if (range.location != NSNotFound)
    {
        [self by_setFont:font range:range];
    }
}


//设置字符串中指定位置的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];
    
    [self setAttributedText: text];
}

- (void)by_setFont:(UIFont *)font range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSFontAttributeName
                 value: font
                 range: range];
    
    [self setAttributedText: text];
}



//设置字符串中指定位置的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)string{
    
    NSRange range = [self.text rangeOfString:string];
    if (range.location != NSNotFound)
    {
        range.location += string.length;
        range.length = self.text.length - range.location;
        [self by_setTextColor:textColor range:range];
    }
}

- (void)by_setFont:(UIFont *)font afterOccurenceOfString:(NSString*)string{
    
    NSRange range = [self.text rangeOfString:string];
    if (range.location != NSNotFound)
    {
        range.location += string.length;
        range.length = self.text.length - range.location;
        [self by_setFont:font range:range];
    }
}

//设置行间距
- (void)by_setLineHeightMargin:(CGFloat)margin
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = margin;//行距
    [style setLineBreakMode:NSLineBreakByTruncatingTail];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0,  self.text.length)];
    [self setAttributedText: attributedString];
}
@end
