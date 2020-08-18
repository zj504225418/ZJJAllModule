//
//  UIView+TEST.h
//  BMCTestResources_Example
//
//  Created by 赵静静 on 2018/12/7.
//  Copyright © 2018年 zj504225418. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (loadResource)

/**
 获取bundle里面的xib对应的view

 @param bundleStr 对应的bundle
 @return 获取到的对象
 */
+(instancetype)by_loadFrameBundle:(NSString *)bundleStr;

/**
 获取bundle里面的xib对应的view

 @param frame view的frame
 @param bundleStr 对应的bundle
 @return 对象view
 */
+(instancetype)by_loadFrameBundleWithFrame:(CGRect)frame bundleStr:(NSString *)bundleStr;

@end

NS_ASSUME_NONNULL_END
