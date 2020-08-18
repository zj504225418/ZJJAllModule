//
//  UIImage+test.m
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import "UIImage+loadResource.h"

@implementation UIImage (loadResource)

/**
 加载组件中的图片

 @param imageName 图片名，组件中需要有2x和3x的图片
 @param bundle 对应组件的bundle
 @param targetClass 对应组件中的任一类
 @return 获取到的图片
 */
+(UIImage *)by_loadBundleImage:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass{

    NSInteger scale = [[UIScreen mainScreen] scale];
    NSBundle *currentBundle = [NSBundle bundleForClass:targetClass];
    NSString *name = [NSString stringWithFormat:@"%@@%zdx",imageName,scale];
    NSString *dir = [NSString stringWithFormat:@"%@.bundle",bundle];

    NSString *path = [currentBundle pathForResource:name ofType:@"png" inDirectory:dir];
    return path ? [UIImage imageWithContentsOfFile:path] : nil;

}

@end
