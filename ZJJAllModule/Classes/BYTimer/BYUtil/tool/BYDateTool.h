//
//  BYDateTool.h
//  credit
//
//  Created by xingxiang on 16/8/30.
//  Copyright © 2016年 baoyin. All rights reserved.
//
//  日期工具
#define JET_LAG  8 * 60 * 60
#import <Foundation/Foundation.h>

/**
 *  日期格式类型
 */
typedef NS_ENUM(NSInteger, DateFormatType) {
    /**
     *  YYYYMMDDHHmmss
     */
    YYYYMMDDHHmmss = 0,
    /**
     *  YYYYMMDD
     */
    YYYYMMDD,
    /**
     *  HHmmss
     */
    HHmmss
};

/**
 *  日期格式类型
 */
typedef NS_ENUM(NSInteger, BYDateType) {

    BYDateTypeYearMonthDay = 0,
    BYDateTypeYearMonth,
    BYDateTypeYear,
    BYDateTypeMonthDay,
    BYDateTypeMonth,
    BYDateTypeDay,
    BYDateTypeMonthDayNoZero//月和日，如果小于10，没有0

};

@interface BYDateTool : NSObject

/**
 *  获取当前系统时间
 *
 *  @return 返回系统时间
 */
+ (NSDate *)getSystemDate;

/**
 *  格式化时间格式
 *
 *  @param #currentDate:NSDate 需要格式化的时间
 *  @param DateFormatType      需要的格式
 *
 *  @return 返回格式化时间的字符串
 */
+ (NSString *)formatDate:(NSDate *) date andFormatType:(DateFormatType) type;

/**
 *  返回时间戳
 *
 *  @return 返回时间戳
 */
+ (long)getTime;

/**
 *  格式化时间格式
 *
 *  @param #currentDate:NSDate 需要格式化的时间
 *  @param DateFormatType      需要的格式
 *
 *  @return 返回格式化时间的字符串
 */
+ (NSString *)stringToDate:(NSDate *) date andFormatStr:(NSString *) formatStr;

/**
 *  字符串转换NSDate
 *
 *  @param dataStr   时间字符串
 *  @param formatStr 格式化
 *
 *  @return 时间
 */
+ (NSDate *)stringToDateStr:(NSString *) dataStr andForatStr:(NSString *) formatStr;

/**
 *  时间戳变为时间字符串
 *
 *  @param timeInterval   时间戳
 *  @param formatStr 格式化
 *
 *  @return 时间字符串
 */
+ (NSString *)stringToTimeInterval:(NSTimeInterval) timeInterval andForatStr:(NSString *) formatStr;

/**
 *  NSDate转换字符串
 *
 *  @param secs 时间戳
 *
 *  @return 字符串
 */
+ (NSString *)DataToString:(NSTimeInterval)secs;

/**
 *  日期换算星期
 *
 *  @param data 时间
 *
 *  @return 换算结果
 */
+ (NSString *)weekByDate:(NSDate *) data;

/**
 *  日期比较
 *
 *  @param nowData  现在的日期
 *  @param lateData 之前的日期
 *
 *  @return 日期差
 */
+ (NSString *)bothDataDifferenceValue:(NSDate *) nowData andlLate:(NSDate *) lateData;

/**
 *  根据时间戳获取字符串
 *
 *  @param containTime 是否包含时分秒
 *  @param timeStamp   时间错
 *
 *  @return 时间字符串
 */
+ (NSString *)getDateString:(BOOL)containTime timeStamp:(long long)timeStamp;


/**
 判断两个时间戳是否是同一天

 @param firsTimeStamp 第一个时间戳
 @param secondTimeStamp 第二个时间戳
 @return 返回的结果
 */
+(BOOL)isSameDay:(long long)firsTimeStamp secondTimesTamp:(long long)secondTimeStamp;

/**
 将YYYYMMDD格式的字符串 转为 YYYY年MM月DD日格式
 
 @param dateString 字符串
 @return 返回的结果
 */
+ (NSString *)transformDate:(NSString *)dateString;

/**
 通过201710220类型的时间返回判断是否是今年

 @param time 时间
 */
+(BOOL)isNearYear:(int64_t)time;
/**
 通过201710220类型的时间返回对应的时间字符串，年月日

 @param time 时间
 @param type 时间类型
 @return 对应的时间字符串
 */
+(NSString *)getDateFromTime:(int64_t)time type:(BYDateType)type;
 /**
  将YYYY-MM-DD HH:mm:ss转换成 格式 YYYYMMDD
  @param timeStr 时间字符串
  @return 对应的时间字符串
  */
+ (NSString *) YYYY_MM_DDConvertToYYYYMMDD:(NSString *)timeStr;
/**
 通过时间字符串返回对应时间类型

 @param timeStr 时间字符串--201801011020
 @return 处理后的字符串--今天 10:20 明天10:20 2018-10-20 10:20
 */
+ (NSString *)getDateStrFromTime:(NSString *)timeStr;
/**
 判断是否是今年

 @param timeInterval 时间戳，毫秒
 */
+ (BOOL)isThisYear:(NSTimeInterval )timeInterval;

@end
