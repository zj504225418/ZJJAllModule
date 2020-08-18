//
//  UIImage+BYHelper.m
//  BMCHttpTool
//
//  Created by user on 2018/11/12.
//

#import "UIImage+BYHelper.h"
#import "BYColorAndFont.h"



@implementation UIImage (BYHelper)
//根据颜色生成一个图片zise=1*1
+(UIImage *)by_imageWithColor:(UIColor *)aColor{
    return [UIImage by_imageWithColor:aColor withSize:CGSizeMake(1, 1)];
}
//根据颜色生成一个图片zise可以定制
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size{
    return [UIImage by_imageWithColor:aColor withSize:size sideCircle:NO];
}

//根据颜色生成一个图片zise可以定制
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size sideCircle:(BOOL)circle{
    return [UIImage by_imageWithColor:aColor withSize:size sideCircle:circle basedOnScale:NO];
}

//根绝size生成按钮的不可点击图片
+(UIImage *)by_disableImageWithSize:(CGSize)size{
    
    return [UIImage by_imageWithColor:UIColorFromRGB(0xdddddd) withSize:size sideCircle:YES basedOnScale:YES];
}

//根据颜色生成一个图片zise可以定制 circle:是否两边圆角
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size sideCircle:(BOOL)circle basedOnScale:(BOOL)base{
    if (base) {
        size = CGSizeMake(size.width*[UIScreen mainScreen].scale, size.height*[UIScreen mainScreen].scale);
    }
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (circle) {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, CGRectGetMidY(rect), 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect)-CGRectGetMidY(rect), 0);
        CGPathAddArc(path, NULL, CGRectGetMaxX(rect)-CGRectGetMidY(rect), CGRectGetMidY(rect), CGRectGetMidY(rect), -M_PI/2, M_PI/2, 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMidY(rect), CGRectGetMaxY(rect));
        CGPathAddArc(path, NULL, CGRectGetMidY(rect), CGRectGetMidY(rect), CGRectGetMidY(rect), M_PI/2, 3*M_PI/2, 0);
        CGPathCloseSubpath(path);
        CGContextSetFillColorWithColor(context, [aColor CGColor]); //设置填充颜色
        CGContextAddPath(context, path); //添加path
        CGContextFillPath(context); //填充path
        CGPathRelease(path);
    }else{
        CGContextSetFillColorWithColor(context, [aColor CGColor]);
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}



//根据颜色生成一个颜色渐变的图片zise可以定制
+(UIImage *)by_imageWithStartColor:(UIColor *)sColor withEndColor:(UIColor *)eColor withSize:(CGSize)size sideCircle:(BOOL)circle{
    
    return [UIImage by_imageWithStartColor:sColor withEndColor:eColor withSize:size sideCircle:circle basedOnScale:NO];
}

//根绝size生成按钮的颜色渐变图片
+(UIImage *)by_normalImageWithSize:(CGSize)size{
    
    return [UIImage by_imageWithStartColor:UIColorFromRGB(0xFE9540) withEndColor:UIColorFromRGB(0xFA5E40) withSize:size sideCircle:YES basedOnScale:YES];;
}

//根据颜色生成一个颜色渐变的图片zise可以定制 b:是否两边圆角 base:是否基于屏幕scale
+(UIImage *)by_imageWithStartColor:(UIColor *)sColor withEndColor:(UIColor *)eColor withSize:(CGSize)size sideCircle:(BOOL)circle basedOnScale:(BOOL)base{
    if (base) {
        size = CGSizeMake(size.width*[UIScreen mainScreen].scale, size.height*[UIScreen mainScreen].scale);
    }
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    if (circle) {
        CGPathMoveToPoint(path, NULL, CGRectGetMidY(rect), 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect)-CGRectGetMidY(rect), 0);
        CGPathAddArc(path, NULL, CGRectGetMaxX(rect)-CGRectGetMidY(rect), CGRectGetMidY(rect), CGRectGetMidY(rect), -M_PI/2, M_PI/2, 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMidY(rect), CGRectGetMaxY(rect));
        CGPathAddArc(path, NULL, CGRectGetMidY(rect), CGRectGetMidY(rect), CGRectGetMidY(rect), M_PI/2, 3*M_PI/2, 0);
    }else{
        //绘制Path
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), 0);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetMaxY(rect));
    }
    CGPathCloseSubpath(path);
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) sColor.CGColor, (__bridge id) eColor.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    //具体方向可根据需求修改
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    //这里一定要先剪切再去设置渐变
    CGContextAddPath(context, path); //设置path
    CGContextClip(context); //剪切
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGPathRelease(path);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


//生成圆角的图片
- (UIImage *)by_getCircleImage
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//把图片的左右两端设置成圆形
- (UIImage *)by_getTwoSideCircleImage
{
    CGFloat image_W = self.size.width;
    CGFloat image_H = self.size.height;
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextMoveToPoint(ctx, image_H/2, 0);
    CGContextAddLineToPoint(ctx, image_W - image_H/2, 0);
    CGContextAddArc(ctx, image_W - image_H/2, image_H/2, image_H/2, -M_PI/2, M_PI/2, 0);
    CGContextAddLineToPoint(ctx, image_H/2, image_H);
    CGContextAddArc(ctx, image_H/2, image_H/2, image_H/2, M_PI/2, 3*M_PI/2, 0);
    CGContextClosePath(ctx);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//生成一个翻转180的图片
-(UIImage *)by_getFanzhuanImage{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    rotate =M_PI;
    rect =CGRectMake(0,0,self.size.width,
                     self.size.height);
    translateX= -rect.size.width;
    translateY= -rect.size.height;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX,translateY);
    CGContextScaleCTM(context, scaleX,scaleY);
    CGContextDrawImage(context, CGRectMake(0,0,rect.size.width, rect.size.height),
                       self.CGImage);
    UIImage *newPic =UIGraphicsGetImageFromCurrentImageContext();
    return newPic;
}
//等比例压缩
+(UIImage *) by_imageYaSuoForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


+(UIImage *) by_imageYaSuoForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}



+ (UIImage *)by_compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}
@end
