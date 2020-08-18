//
//  UIViewController+test.h
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (loadResource)

/**
 获取组件对应的控制器,默认storyboard中控制器对应的identifier是控制的类名

 @param bundleStr 对应组件的bundle
 @param storyboardName 对应storyboard名
 @return 获取到的控制器
 */
+(instancetype)by_loadFrameBundle:(NSString *)bundleStr storyboardName:(NSString *)storyboardName;



@end

NS_ASSUME_NONNULL_END
