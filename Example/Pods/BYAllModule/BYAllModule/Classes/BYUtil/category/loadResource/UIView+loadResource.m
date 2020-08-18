//
//  UIView+TEST.m
//  BMCTestResources_Example
//
//  Created by 赵静静 on 2018/12/7.
//  Copyright © 2018年 zj504225418. All rights reserved.
//

#import "UIView+loadResource.h"
#import "NSBundle+loadResource.h"

@implementation UIView (loadResource)

/**
 获取bundle里面的xib对应的view

 @param bundleStr 对应的bundle
 @return 获取到的对象view
 */
+(instancetype)by_loadFrameBundle:(NSString *)bundleStr{

    NSBundle *xibBundle = [NSBundle by_myLibraryBundle:bundleStr targetClass:self];

    return [[xibBundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

/**
 获取bundle里面的xib对应的view

 @param frame view的frame
 @param bundleStr 对应的bundle
 @return 对象view
 */
+(instancetype)by_loadFrameBundleWithFrame:(CGRect)frame bundleStr:(NSString *)bundleStr{

    UIView *view = [self by_loadFrameBundle:bundleStr];
    view.frame = frame;
    return view;
}

@end
