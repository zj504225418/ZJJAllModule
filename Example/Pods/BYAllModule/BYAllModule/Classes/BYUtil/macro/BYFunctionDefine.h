//
//  BYFunctionDefine.h
//  Pods
//
//  Created by user on 2019/1/16.
//

#ifndef BYFunctionDefine_h
#define BYFunctionDefine_h
//设置图片
#define BY_IMAGE(name) [UIImage imageNamed:name]

//处理字符串
#define KNotNullStr(str) str.length == 0 ? @"":str

//Block Self转换，需配套使用
#define WEAK_SELF __weak __typeof__(self) weakSelf = self;
#define STRONG_SELF __strong __typeof__(weakSelf) strongSelf = weakSelf;

#endif /* BYFunctionDefine_h */
