//
//  UIViewController+test.m
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import "UIViewController+loadResource.h"
#import "NSBundle+loadResource.h"

@implementation UIViewController (loadResource)

/**
 获取组件对应的控制器,默认storyboard中控制器对应的identifier是控制的类名

 @param bundleStr 对应组件的bundle
 @param storyboardName 对应storyboard名
 @return 获取到的控制器
 */
+(instancetype)by_loadFrameBundle:(NSString *)bundleStr storyboardName:(NSString *)storyboardName{
;
    return [self by_loadFrameBundle:bundleStr storyboardName:storyboardName identifier:NSStringFromClass(self)];
}

/**
 获取组件对应的控制器

 @param bundleStr 对应组件的bundle
 @param storyboardName 对应storyboard名
 @param identifier storyboard中控制器对应的identifier
 @return 取到的控制器
 */
+(instancetype)by_loadFrameBundle:(NSString *)bundleStr storyboardName:(NSString *)storyboardName identifier:(NSString *)identifier{

    NSBundle *bundle = [NSBundle by_myLibraryBundle:bundleStr targetClass:self];
    UIViewController *vc = [[UIStoryboard storyboardWithName:storyboardName bundle:bundle] instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

@end
