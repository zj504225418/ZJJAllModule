//
//  BYDeviceInfoTool.m
//  BMCUtil
//
//  Created by user on 2019/1/14.
//

#import "BYDeviceInfoTool.h"
#import <sys/sysctl.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <sys/mount.h>
#import <mach/vm_statistics.h>
#include <mach/mach.h>

@implementation BYDeviceInfoTool
/**
 *  获取设备名称
 *  @return 设备名称
 */
+ (NSString *)by_getMachineName
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone7Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone7Plus";
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone8Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone8Plus";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhoneX";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhoneX";
    
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhoneXR";
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhoneXS";
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    
    
    
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPodTouch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPodTouch2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPodTouch3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPodTouch4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPodTouch5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPodTouch6G";
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4";
    
    //iPad Air
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPadAir2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPadAir2";
    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPadmini4";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPadmini4";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhoneSimulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhoneSimulator";
    return platform;
}


/**
 *  获取运营商名称
 *  @return 运营商名称
 */
+ (NSString *)by_getComProvider
{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    //        cn http://en.wikipedia.org/wiki/Mobile_country_code
    //        460   00    China Mobile    China Mobile    Operational
    //        460    01    China Unicom    China Unicom    Operational
    //        460    02    China Mobile    China Mobile    Not operational
    //        460    03    China Telecom    China Telecom    Operational
    //        460    05    China Telecom    China Telecom    Not operational
    //        460    06    China Unicom    China Unicom    Not operational
    //        460    07    China Mobile    China Mobile    Not operational
    //        460    20    China Tietong    China Tietong    Operational    GSM-R
    //  apn
    if(carrier)
    {
        //无法获取接入点，只能用运营商，默认为net方式，not support wap type
        if([carrier.mobileNetworkCode isEqualToString:@"00"] || [carrier.mobileNetworkCode isEqualToString:@"02"]||
           [carrier.mobileNetworkCode isEqualToString:@"07"]||
           [carrier.mobileNetworkCode isEqualToString:@"20"])//移动
        {
            return @"中国移动";//@"cmnet";
        }
        else if ([carrier.mobileNetworkCode isEqualToString:@"06"]||
                 [carrier.mobileNetworkCode isEqualToString:@"09"])//联通
        {
            return @"中国联通";//@"3gnet";
        }
        else if ([carrier.mobileNetworkCode isEqualToString:@"03"] || [carrier.mobileNetworkCode isEqualToString:@"05"]||
                 [carrier.mobileNetworkCode isEqualToString:@"11"])//电信
        {
            return @"中国电信";//@"ctnet";
        }
    }
    return @"";
}


+(NSDictionary *)SSIDInfo{
    
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    NSDictionary *info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    return info;
}

/**
 *  获取wifiMac地址
 */
+(NSString *)by_getWifiMac{
    
    NSDictionary *SSIDInfo = [self SSIDInfo];
    return SSIDInfo[@"BSSID"];
}

/**
 *  获取wifi名字
 */
+(NSString *)by_getWifiName{
    
    NSDictionary *SSIDInfo = [self SSIDInfo];
    return SSIDInfo[@"SSID"];
}


/**
 是否可以指纹或者面容
 @return 指纹对象
 */
+(LAContext *)by_isCouldFingerprint:(NSString *)titleStr{
    
    //创建LAContext
    LAContext *context = [LAContext new]; //这个属性是设置指纹输入失败之后的弹出框的选项
    if (titleStr.length > 0) {
        context.localizedFallbackTitle = titleStr;
    }
    //    context.localizedReason = @"指纹识别原因";
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                             error:&error]) {
        
        return context;
    }else{
        
        switch (error.code) {
                case LAErrorTouchIDNotEnrolled:
            {
//                APP_LOG_INFO(@"TouchID is not enrolled");
                break;
            }
                case LAErrorPasscodeNotSet:
            {
//                APP_LOG_INFO(@"A passcode has not been set");
                break;
            } case LAErrorTouchIDLockout: // 用户连续多次进行Touch ID验证失败，Touch ID被锁，需要用户输入密码解锁，先Touch ID验证密码
            {
                //                [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                //                    if (success) {
                //
                //                    }else{
                //
                //                    }
                //                }];
//                APP_LOG_INFO(@"Touch ID被锁，需要用户输入密码解锁"); // -8 连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码
                return context;
            }
                break;
            default:
            {
//                APP_LOG_INFO(@"TouchID not available");
                break;
            }
        }
        
//        APP_LOG_INFO(@"%@",error.localizedDescription);
        return nil;
    }
}

//判断是指纹还是faceID
+(BOOL)by_isFaceIDWith:(LAContext *)context{
    if (@available(iOS 11.0, *)) {
        if (context.biometryType == LABiometryTypeTouchID) {
            return NO;
        }else if (context.biometryType == LABiometryTypeFaceID){
            return YES;
        }
    }
    return NO;
}



+(NSString *)fileSizeToString:(unsigned long long)fileSize
{
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;
    
    if (fileSize < 10)
    {
        return @"0 B";
        
    }else if (fileSize < KB)
    {
        return @"< 1 KB";
        
    }else if (fileSize < MB)
    {
        return [NSString stringWithFormat:@"%.1f KB",((CGFloat)fileSize)/KB];
        
    }else if (fileSize < GB)
    {
        return [NSString stringWithFormat:@"%.1f MB",((CGFloat)fileSize)/MB];
        
    }else
    {
        return [NSString stringWithFormat:@"%.1f GB",((CGFloat)fileSize)/GB];
    }
}

/**
 *  获取总磁盘容量
 *
 *  @return 总磁盘容量
 */
+(NSString *)by_getTotalDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return [self fileSizeToString:freeSpace];
}

/**
 *  获取可用磁盘容量
 *
 *  @return 可用磁盘容量
 */
+(NSString *)by_getAvailableDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return [self fileSizeToString:freeSpace];
}

/**
 *  获取总内存大小
 *
 *  @return 总内存大小
 */
+(NSString *)by_getTotalMemorySize
{
    unsigned long long freeSpace = [NSProcessInfo processInfo].physicalMemory;
    return [self fileSizeToString:freeSpace];
}

/**
 *  获取可用内存大小
 *
 *  @return 可用内存大小
 */
+(NSString *)by_getAvailableMemorySize
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return nil;
    }
    unsigned long long freeSpace = ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
    return [self fileSizeToString:freeSpace];
}



/**
 *  获取电池状态
 *
 *  @return 电池状态
 */
+(CGFloat)by_getBatteryQuantity
{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [[UIDevice currentDevice] batteryLevel];
}
@end
