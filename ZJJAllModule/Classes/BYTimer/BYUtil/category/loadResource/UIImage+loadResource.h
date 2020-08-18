//
//  UIImage+test.h
//  BMCTestResources
//
//  Created by 赵静静 on 2018/12/7.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (loadResource)
+(UIImage *)by_loadBundleImage:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass;
@end

NS_ASSUME_NONNULL_END
