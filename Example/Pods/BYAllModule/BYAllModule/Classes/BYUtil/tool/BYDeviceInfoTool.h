//
//  BYDeviceInfoTool.h
//  BMCUtil
//
//  Created by user on 2019/1/14.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
NS_ASSUME_NONNULL_BEGIN

@interface BYDeviceInfoTool : NSObject
/**
 *  获取设备名称
 *  @return 设备名称
 */
+ (NSString *)by_getMachineName;

/**
 *  获取运营商名称
 *  @return 运营商名称
 */
+ (NSString *)by_getComProvider;


/**
 *  获取wifiMac地址
 */
+(NSString *)by_getWifiMac;

/**
 *  获取wifi名字
 */
+(NSString *)by_getWifiName;


/**
 是否可以指纹或者面容
 @return 指纹对象
 */
+(LAContext *)by_isCouldFingerprint:(NSString *)titleStr;

//判断是指纹还是faceID
+(BOOL)by_isFaceIDWith:(LAContext *)context;




/**
 *  获取总磁盘容量
 *
 *  @return 总磁盘容量
 */
+(NSString *)by_getTotalDiskSize;

/**
 *  获取可用磁盘容量
 *
 *  @return 可用磁盘容量
 */
+(NSString *)by_getAvailableDiskSize;


/**
 *  获取总内存大小
 *
 *  @return 总内存大小
 */
+(NSString *)by_getTotalMemorySize;


/**
 *  获取可用内存大小
 *
 *  @return 可用内存大小
 */
+(NSString *)by_getAvailableMemorySize;



/**
 *  获取电池状态
 *
 *  @return 电池状态
 */
+(CGFloat)by_getBatteryQuantity;
@end

NS_ASSUME_NONNULL_END
