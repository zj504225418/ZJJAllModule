//
//  NSBundle+test.m
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import "NSBundle+loadResource.h"

@implementation NSBundle (loadResource)

/**
 通过bundle名获取对应的bundle

 @param bundleStr bundle名
 @return 对应的bundle
 */
+ (NSBundle *)by_myLibraryBundle:(NSString *)bundleStr targetClass:(Class)targetClass {

    NSURL *url = [self by_myLibraryBundleURL:bundleStr targetClass:targetClass];
    return [self bundleWithURL:url];
}


+ (NSURL *)by_myLibraryBundleURL:(NSString *)bundleStr targetClass:(Class)targetClass{

    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    NSLog(@"%@  \n mainBundle: %@",bundle,[NSBundle mainBundle]);
    return [bundle URLForResource:bundleStr withExtension:@"bundle"];
}

@end
