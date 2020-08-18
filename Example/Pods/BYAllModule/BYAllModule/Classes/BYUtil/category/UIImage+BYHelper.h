//
//  UIImage+BYHelper.h
//  BMCHttpTool
//
//  Created by user on 2018/11/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//三张灰色图
#define Small_btn_disabled [UIImage by_disableImageWithSize:CGSizeMake(180, 44)]
#define Mid_btn_disabled [UIImage by_disableImageWithSize:CGSizeMake(315, 44)]
#define BIg_btn_disabled [UIImage by_disableImageWithSize:CGSizeMake(345, 44)]

//三张渐变颜色图
#define Small_btn_normal [UIImage by_normalImageWithSize:CGSizeMake(180, 44)]
#define Mid_btn_normal [UIImage by_normalImageWithSize:CGSizeMake(315, 44)]
#define Big_btn_normal [UIImage by_normalImageWithSize:CGSizeMake(345, 44)]
@interface UIImage (BYHelper)
//根据颜色生成一个图片zise=1*1
+(UIImage *)by_imageWithColor:(UIColor *)aColor;

//根据颜色生成一个图片zise可以定制
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size;
//根据颜色生成一个图片zise可以定制 circle:是否两边圆角
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size sideCircle:(BOOL)circle;
//根绝size生成按钮的不可点击图片
+(UIImage *)by_disableImageWithSize:(CGSize)size;
//根据颜色生成一个图片zise可以定制 circle:是否两边圆角
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size sideCircle:(BOOL)circle basedOnScale:(BOOL)base;

//根据颜色生成一个颜色渐变的图片zise可以定制 circle:是否两边圆角 base:是否基于屏幕scale
+(UIImage *)by_imageWithStartColor:(UIColor *)sColor withEndColor:(UIColor *)eColor withSize:(CGSize)size sideCircle:(BOOL)circle;

//根绝size生成按钮的颜色渐变图片
+(UIImage *)by_normalImageWithSize:(CGSize)size;

//根据颜色生成一个颜色渐变的图片zise可以定制 circle:是否两边圆角 base:是否基于屏幕scale
+(UIImage *)by_imageWithStartColor:(UIColor *)sColor withEndColor:(UIColor *)eColor withSize:(CGSize)size sideCircle:(BOOL)circle basedOnScale:(BOOL)base;

//生成圆角的图片
- (UIImage *)by_getCircleImage;
//把图片的左右两端设置成圆形
- (UIImage *)by_getTwoSideCircleImage;
//生成一个翻转180的图片
-(UIImage *)by_getFanzhuanImage;
//等比例压缩
+(UIImage *) by_imageYaSuoForSize:(UIImage *)sourceImage targetSize:(CGSize)size;



+(UIImage *) by_imageYaSuoForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


+ (UIImage *)by_compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;
@end

NS_ASSUME_NONNULL_END
