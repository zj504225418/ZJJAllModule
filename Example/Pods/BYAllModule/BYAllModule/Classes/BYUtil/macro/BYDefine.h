//
//  BYDefine.h
//  Pods
//
//  Created by user on 2018/11/6.
//

#ifndef BYDefine_h
#define BYDefine_h

//app版本号
#define kAppShortVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//屏幕宽
#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)
//屏幕高
#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)

//USERDEFFAULTS
#define USERDEFFAULTS [NSUserDefaults standardUserDefaults]
//BYKeyWindow
#define BYKeyWindow [UIApplication sharedApplication].keyWindow
//kStatusBarHeight
#define kStatusBarHeight                   [[UIApplication sharedApplication] statusBarFrame].size.height

#define NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))

#define kWindowStatusAndNavigationBarHeight                       ([[UIApplication sharedApplication] statusBarFrame].size.height+44)


//系统版本
#define IS_IOS8_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0?YES:NO)
#define IS_IOS9_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0?YES:NO)
#define IS_IOS10_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0?YES:NO)
#define IS_IOS11_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue]>=11.0?YES:NO)
#define IS_IOS12_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue]>=12.0?YES:NO)


//设备型号
//ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//4s
#define IS_IPHONE4_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)480) < DBL_EPSILON)
//iPhone5 & iPhone5c & iPhone5s & iPhone SE
#define IS_IPHONE5_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)568) < DBL_EPSILON)
//iPhone6 & iPhone6s
#define IS_IPHONE6_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)667) < DBL_EPSILON)
//iPhone6 plus & iPhone6s plus
#define IS_IPHONE6PLUS_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)736) < DBL_EPSILON)
//iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//全面屏X系列
#define IS_IPHONEX_SERIAL (IS_IPHONE_X||IS_IPHONE_Xr||IS_IPHONE_Xs||IS_IPHONE_Xs_Max)


//导航栏高度  
#define kNavigationHight                    (IS_IPHONEX_SERIAL ? 88.f : 64.f)
//tabbar高度
#define kTabbarHight                        (IS_IPHONEX_SERIAL ? 83.f : 48.f)
//tabbar下面高度（针对X系列）
#define kBottomHight                        (IS_IPHONEX_SERIAL ? 34.f : 0.f)

#endif /* BYDefine_h */
