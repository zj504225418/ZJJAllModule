//
//  BYColorAndFont.h
//  credit
//
//  Created by user on 2018/11/7.
//  Copyright © 2018年 baoyin. All rights reserved.
//

#ifndef BYColorAndFont_h
#define BYColorAndFont_h
//color
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define UIColorDDDDDD UIColorFromRGB(0xdddddd)
#define UIColorCCCCCC UIColorFromRGB(0xcccccc)
#define UIColor333333 UIColorFromRGB(0x333333)

#define kAppColorMain UIColorFromRGB(0xEE6622)


//字体
#define BY_Font(A) [UIFont systemFontOfSize:A]
#define BY_BoldFont(A) [UIFont boldSystemFontOfSize:A]

#endif /* BYColorAndFont_h */
