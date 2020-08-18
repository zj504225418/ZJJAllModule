//
//  BYDateTool.m
//  credit
//
//  Created by xingxiang on 16/8/30.
//  Copyright © 2016年 baoyin. All rights reserved.
//

#define DAY_TIME 24 * 60 * 60
#define JET_LAG  8 * 60 * 60

#import "BYDateTool.h"

@implementation BYDateTool

+ (NSDate *)getSystemDate {

//    return [NSDate dateWithTimeIntervalSinceNow:[[NSDate date] timeIntervalSinceNow]+(double)JET_LAG];
    return [NSDate dateWithTimeIntervalSinceNow:[[NSDate date] timeIntervalSinceNow]];
}

+ (NSString *)formatDate:(NSDate *) date andFormatType:(DateFormatType) type {
    
    NSString *foramtStr = @"";
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    switch (type) {
        case YYYYMMDDHHmmss:
        {
            [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        }
            break;
            
        case YYYYMMDD:
        {
            [format setDateFormat:@"yyyy-MM-dd"];
        }
            break;
        case HHmmss:
        {
            [format setDateFormat:@"HH-mm-ss-"];
        }
            break;
        default:
            break;
    }
    
    foramtStr = [format stringFromDate:date];
    return foramtStr;
}

+ (NSString *)stringToDate:(NSDate *) date andFormatStr:(NSString *) formatStr {
    
    NSString *_foramtStr = @"";
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatStr];
    _foramtStr = [format stringFromDate:date];
    return _foramtStr;
}

+ (long)getTime{
    return (long)[ [BYDateTool getSystemDate] timeIntervalSince1970];
}

+ (NSDate *)stringToDateStr:(NSString *) dataStr andForatStr:(NSString *) formatStr{

    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatStr];
    NSDate* date = [formater dateFromString:dataStr];

    if([formatStr isEqualToString:@"yyyy-MM-dd HH:mm:ss"]){
        NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:[date timeIntervalSinceNow]];
        return date2;
    }else{
        NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:[date timeIntervalSinceNow]+(double)JET_LAG];
        return date2;
    }
}

/**
 *  时间戳变为时间字符串
 *
 *  @param timeInterval   时间戳
 *  @param formatStr 格式化
 *
 *  @return 时间字符串
 */
+ (NSString *)stringToTimeInterval:(NSTimeInterval) timeInterval andForatStr:(NSString *) formatStr{

    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];

    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatStr];

//    if([formatStr isEqualToString:@"yyyy-MM-dd HH:mm"]){
//        NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:[date timeIntervalSinceNow]];
//        return date2;
//    }else{
//        NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:[date timeIntervalSinceNow]+(double)JET_LAG];
//        return date2;
//    }

    return [formater stringFromDate:date];
}


+ (NSString *)DataToString:(NSTimeInterval)secs{
    
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:secs];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return [localeDate description];
}

+ (NSString *)weekByDate:(NSDate *) data{
    //
    //    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    //    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    //    comps = [calendar components:unitFlags fromDate:data];
    //    int week = (int)[comps weekday];
    //    if(IOS6){
    //        week = week - 1;
    //    }
    //    switch (week) {
    //        case 1:
    //        {
    //            return @"周日";
    //        }
    //            break;
    //
    //        case 2:
    //        {
    //            return @"周一";
    //        }
    //            break;
    //        case 3:
    //        {
    //            return @"周二";
    //        }
    //            break;
    //        case 4:
    //        {
    //            return @"周三";
    //        }
    //            break;
    //        case 5:
    //        {
    //            return @"周四";
    //        }
    //            break;
    //        case 6:
    //        {
    //            return @"周五";
    //        }
    //            break;
    //        case 7:
    //        {
    //            return @"周六";
    //        }
    //            break;
    //            default:
    //            return  @"";
    //
    //    }
    
    return  @"";
}

+ (NSString *)bothDataDifferenceValue:(NSDate *) nowData andlLate:(NSDate *) lateData
{
    
    NSString *timeString=@"";
    NSTimeInterval late=[lateData timeIntervalSince1970]*1;
    NSTimeInterval now=[nowData timeIntervalSince1970]*1;
    NSTimeInterval cha=late-now;
    
    //    APP_LOG_DEBUG(@"nowData = %@  lateData = %@ cha = %f",nowData,lateData,cha);
    if(cha/3600.0f<1){
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@", timeString];
        
        return [NSString stringWithFormat:@"%@分钟前",timeString];
    }
    
    if (cha/3600.0f>1&&cha/86400.0f<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@", timeString];
        
        return [NSString stringWithFormat:@"%@小时前",timeString];
    }
    if (cha/86400.0f>1)
    {
        return [self stringToDate:lateData andFormatStr:@"yyyy-MM-dd HH:mm"];
    }else if(cha == 86400){
        return @"1天";
    }
    
    return nil;
    
}

+ (NSString *)getDateString:(BOOL)containTime timeStamp:(long long)timeStamp {
    NSDate *applyDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (containTime) {
        [formatter setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"yyyy.MM.dd"];
    }
    return [formatter stringFromDate:applyDate];
}

+(BOOL)isSameDay:(long long)firsTimeStamp secondTimesTamp:(long long)secondTimeStamp{

    NSCalendar* calendar = [NSCalendar currentCalendar];

    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;

    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:firsTimeStamp];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:secondTimeStamp];

    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];

    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];

    return [comp1 day] == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

+ (NSString *)transformDate:(NSString *)dateString{
    
    NSString * year = [dateString substringToIndex:4];
    NSRange range = NSMakeRange(4, 2);
    NSString *month = [dateString substringWithRange:range];
    NSString * day = [dateString substringFromIndex:6];
    NSString *result = [NSString stringWithFormat:@"%@年%@月%@日",year,month,day];
    return result;
}

/**
 通过201710220类型的时间返回判断是否是今年

 @param time 时间
 */
+(BOOL)isNearYear:(int64_t)time{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    int64_t year = time/10000;
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:[NSDate date]];
    return selfCmps.year == year;
}

/**
 通过201710220类型的时间返回对应的时间字符串，年月日

 @param time 时间
 @param type 时间类型
 @return 对应的时间字符串
 */
+(NSString *)getDateFromTime:(int64_t)time type:(BYDateType)type{

    int64_t year = time/10000;
    int64_t monthAndDay = time%10000;
    int64_t month = monthAndDay/100;
    int64_t day = monthAndDay%100;

    NSString *monthStr = nil;
    NSString *dayStr = nil;

    if (month < 10 && type != BYDateTypeMonthDayNoZero) {
        monthStr = [NSString stringWithFormat:@"0%lld",month];
    }else{
        monthStr = [NSString stringWithFormat:@"%lld",month];
    }

    if (day < 10 && type != BYDateTypeMonthDayNoZero) {
        dayStr = [NSString stringWithFormat:@"0%lld",day];
    }else{
        dayStr = [NSString stringWithFormat:@"%lld",day];
    }

    if (type == BYDateTypeYearMonthDay) {
        return [NSString stringWithFormat:@"%lld年%@月%@日",year,monthStr,dayStr];
    }else if(type == BYDateTypeYearMonth){
        return [NSString stringWithFormat:@"%lld年%@月",year,monthStr];
    }else if(type == BYDateTypeYear){
        return [NSString stringWithFormat:@"%lld年",year];
    }else if(type == BYDateTypeMonthDay){
        return [NSString stringWithFormat:@"%@月%@日",monthStr,dayStr];
    }else if(type == BYDateTypeMonth){
        return [NSString stringWithFormat:@"%@月",monthStr];
    }else if(type == BYDateTypeDay){
        return [NSString stringWithFormat:@"%@日",dayStr];
    }else if (type == BYDateTypeMonthDayNoZero){
        return [NSString stringWithFormat:@"%@月%@日",monthStr,dayStr];
    }
    return nil;
}
/**
 将YYYY-MM-DD HH:mm:ss转换成 格式 YYYYMMDD
 @param timeStr 时间字符串
 @return 对应的时间字符串
 */
+ (NSString *) YYYY_MM_DDConvertToYYYYMMDD:(NSString *)timeStr{
    
    NSArray *array = [timeStr
                      componentsSeparatedByString:@" "];
    NSArray *array1 = [array[0]
                       componentsSeparatedByString:@"-"];
    NSString * result = [NSString stringWithFormat:@"%@%@%@",array1[0],array1[1],array1[2]];
    return result;
}

+(NSString *)handHourMinSecTime:(int64_t)smallDateInt{

    int64_t hour = smallDateInt/10000;
    int64_t minuteAndSecond = smallDateInt%10000;
    int64_t minute = minuteAndSecond/100;
    int64_t second = minuteAndSecond%100;

    NSString *hourStr = nil;
    NSString *minuteStr = nil;
    NSString *secondStr = nil;

    if (hour < 10) {
        hourStr = [NSString stringWithFormat:@"0%lld",hour];
    }else{
        hourStr = [NSString stringWithFormat:@"%lld",hour];
    }

    if (minute < 10) {
        minuteStr = [NSString stringWithFormat:@"0%lld",minute];
    }else{
        minuteStr = [NSString stringWithFormat:@"%lld",minute];
    }

    if (second < 10) {
        secondStr = [NSString stringWithFormat:@"0%lld",second];
    }else{
        secondStr = [NSString stringWithFormat:@"%lld",second];
    }

    return [NSString stringWithFormat:@"%@:%@:%@",hourStr,minuteStr,secondStr];
}

/**
 通过时间字符串返回对应时间类型

 @param timeStr 时间字符串--201801011020 yyyyMMddHHmmss
 @return 处理后的字符串--今天 10:20 明天10:20 2018-10-20 10:20
 */
+ (NSString *)getDateStrFromTime:(NSString *)timeStr{

//    if (timeStr.length < 14) {
//        for (int i = timeStr.length; i < 14; i++) {
//            timeStr = [NSString stringWithFormat:@"%@0",timeStr];
//        }
//    }
    //处理年月日时间
//    NSString *bigDateStr = [timeStr substringToIndex:10];
//    int64_t bigDateInt = [bigDateStr intValue];
//    NSString *nearMonthDatDateStr = [self getDateFromTime:bigDateInt type:BYDateTypeYearMonthDay];
//    //处理时分秒时间
//    NSString *smallDateStr = [timeStr substringFromIndex:8];
//    int64_t smallDateInt = [smallDateStr intValue];
//    NSString *hourMinSecDateStr = [self handHourMinSecTime:smallDateInt];

//    APP_LOG_INFO(@"bigDateStr:%@ smallDateStr:%@",bigDateStr,smallDateStr);
//    NSString *dateStr = [NSString stringWithFormat:@"%@ %@",nearMonthDatDateStr,hourMinSecDateStr];

    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [formater dateFromString:timeStr];

    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;

    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];

    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    //传入的时间
    NSString * dateString = [[date description] substringToIndex:10];

//    APP_LOG_INFO(@"\n yesterdayString:%@ \n todayString: %@ \n tomorrowString: %@ \n  [date description]:%@",yesterdayString,todayString,tomorrowString,[date description]);

    NSString *endStr = nil;
    if ([dateString isEqualToString:todayString]){

        endStr = @"今天";
    } else if ([dateString isEqualToString:yesterdayString]){

        endStr =  @"昨天";
    }else if ([dateString isEqualToString:tomorrowString]){

        endStr =  @"明天";
    }

    if (endStr) {

        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"HH:mm"];
        NSString *str = [formater stringFromDate:date];
        return [NSString stringWithFormat:@"%@ %@",endStr,str];

    }else{

        NSString * todayYearString = [[today description] substringToIndex:4];
        NSString * nowYearString = [[date description] substringToIndex:4];

        NSString *dateType = nil;
        //如果年份不是今年的话就展示年份，是今年的话就只展示月份和日期
//        if ([todayYearString isEqualToString:nowYearString]) {
            dateType = @"yyyy-MM-dd HH:mm";
//        }else{
//            dateType = @"yyyy-MM-dd HH:mm";
//        }
        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:dateType];
        NSString *str = [formater stringFromDate:date];
        return str;
    }
}

/**
 判断是否是今年

 @param timeInterval 时间戳，毫秒
 */
+ (BOOL)isThisYear:(NSTimeInterval )timeInterval{

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    return nowCmps.year == selfCmps.year;
}


@end
