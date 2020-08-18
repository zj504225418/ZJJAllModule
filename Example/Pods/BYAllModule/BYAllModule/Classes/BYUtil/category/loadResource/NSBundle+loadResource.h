//
//  NSBundle+test.h
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (loadResource)

/**
 通过bundle名获取对应的bundle

 @param bundleStr bundle名
 @param targetClass bundle所在u组件中的一个类
 @return 得到的对应bundle
 */
+ (NSBundle *)by_myLibraryBundle:(NSString *)bundleStr targetClass:(Class)targetClass;

@end

NS_ASSUME_NONNULL_END
